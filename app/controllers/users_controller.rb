class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    if isLoggedIn?
          @offset = 0;
          @offset =  params[:offset].to_i if params[:offset]
          
          puts "Getting user friends list..."
          graph_url = "https://graph.facebook.com/me/friends?limit=50&offset=#{@offset*30}&access_token=#{uri_escape(session[:facebook_access_token])}"
          @next = false
          @prev = false

          puts graph_url
          r = RestClient.get graph_url
          data = JSON.parse(r.to_s)
          user_friends = data["data"]
          @next = true if data["paging"]["next"]
          @prev = true if data["paging"]["previous"]
          @friends = {}
          user_friends.each{|tmp| @friends[tmp['name']] = tmp['id']}
        @user = User.find_by_facebook_id(session[:facebook_id])
    else
        @friends = []
        @user = nil 
    end
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, :notice => 'User was successfully created.' }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, :notice => 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
