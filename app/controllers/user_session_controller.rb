class UserSessionController < ApplicationController

  def destroy  
     reset_session
     redirect_to root_url, :notice => "Logged out!"  
  end 

  # Login Facebook
  def login_facebook
       url = "https://www.facebook.com/dialog/oauth?client_id=#{getFacebookApiKey()}&scope=email,publish_stream,user_location,read_friendlists,friends_location&redirect_uri=#{getAppUrl()}fbcallback"
       redirect_to url
  end
 
  # Login Facebook callback
  def login_facebook_callback
    require 'json'
    require 'rest_client'

    str_error = "There was an error trying to login to your Facebook account, please try again."
    puts "login facebook callback request received...#{request.url}"
    if(params[:error] and params[:error] != '')
       flash[:error] = str_error
       puts params[:error]
       redirect_to '/'
    elsif(params[:code] and params[:code] != '')
      puts "Got code back..."
       code = params[:code]
       url = "https://graph.facebook.com/oauth/access_token?client_id=#{getFacebookApiKey()}&client_secret=#{getFacebookSecret()}&redirect_uri=#{getAppUrl()}fbcallback&code=#{code}"
       puts url
       begin
         r = RestClient.get url
       rescue Exception => ex
         flash[:error] = str_error
         redirect_to '/'
         return
       end
       puts r.to_s.gsub(/\&expires\=\d*$/,'')
       access_token = r.to_s.split("access_token=")[1]
       session[:facebook_access_token] = access_token.gsub(/\&expires\=\d*$/,'')
       graph_url = "https://graph.facebook.com/me?access_token=#{uri_escape(session[:facebook_access_token])}"
       puts graph_url
       r = RestClient.get graph_url
       user = JSON.parse(r.to_s)
       find_or_create_user(user)
       session[:facebook_loggedIn] = true
       session[:facebook_id] = user['id']
       session[:facebook_currentuser] = user['first_name']+' '+user['last_name']
       session[:facebook_username] = user['username']
       puts "#{user} logged in successfully with facebook #{user.class}"
       
       puts "Getting user friends list..."
       graph_url = "https://graph.facebook.com/me/friends?access_token=#{uri_escape(session[:facebook_access_token])}"
       puts graph_url
       r = RestClient.get graph_url
       data = JSON.parse(r.to_s)
       user_friends = data["data"]
       hashids = []
       user_friends.each{|tmp| hashids << tmp['id']}
       #session[:facebook_friends] = hashids
       flash[:notice] = "Facebook authentication successfull, Now you can share to your facebook wall."
       redirect_to '/'
    else
       flash[:error] = str_error
       puts "unknown error"
       redirect_to '/fblogin'
    end
  end

  def logout_facebook
    ##url = "https://www.facebook.com/logout.php?next=#{getAppUrl()}&access_token=#{session[:access_token]}"
    ##puts url
    session[:facebook_loggedIn] = false
    session[:facebook_access_token] = nil
    session[:facebook_currentuser] = nil
    session[:facebook_username] = nil
    redirect_to getStoredUrl
  end

  def post_to_facebook()
   require 'json'
   require 'rest_client'

   if not isLoggedIn? 
     redirect_to '/fblogin'
     return
   end

   puts "Posting to fb wall #{session[:facebook_access_token]}"
   link = getAppUrl()
   begin
     r = RestClient.post "https://graph.facebook.com/#{session[:facebook_username]}/feed", { :access_token => session[:facebook_access_token], 
                                                                                             :message => "I have joined sharethon", 
                                                                                             :caption => "Shared via sharethon app" 
                                                                                           }
     responsegot = JSON.parse r.to_s
     flash[:notice] = 'Share on your facebook timeline success...'
     redirect_to '/'
   rescue Exception => ex
     flash[:notice] = ex.message
     puts ex
     redirect_to '/'
   end
   
  end
  
  
end
