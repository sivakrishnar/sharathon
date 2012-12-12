module ApplicationHelper

  def full_title(page_title)
    base_title = 'Sharathon - Welcome to the world of sharing and living socially.'
    if page_title.empty?
        base_title
    else
        "#{base_title} | #{page_title}"
    end
  end
  
  def getFacebookApiKey()
    return '534120616600987'
  end
  
  def getFacebookSecret()
    return '90a73dc34606b3a37a3a420e33e53bd4'
  end
    
  def getAppUrl()
    return 'http://localhost:3000/'
    ret##urn 'http://quotesapp.herokuapp.com/'
  end
  
  def uri_escape(url)
     require 'uri'
     str = URI.escape(url)
     return str
  end
  
  def isLoggedIn?
    session[:facebook_loggedIn]
  end
  
  def currentuser
    session[:facebook_currentuser]
  end
  
  def find_or_create_user(user)
    unless User.where(:facebook_id => user['id']).exists?
      theuser = User.new({:facebook_id => user['id'], 
                          :email =>user['email'],
                          :firstname => user['first_name'],
                          :middlename => user['middle_name'],
                          :lastname => user['last_name'],
                          :gender => user['gender']
                         })
      puts theuser.new_record?
      if theuser.save
        puts "#{theuser['username']} saved into db..."
      end
    end
  end
  
  def wanted_actions
    WantedAction.all
  end
  
end
