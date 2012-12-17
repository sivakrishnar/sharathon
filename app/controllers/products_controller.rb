class ProductsController < ApplicationController
  include ProductsHelper

  # GET /products
  # GET /products.json
  def index
    @product = Product.new
    if isLoggedIn?
        puts "Getting user friends list..."
        graph_url = "https://graph.facebook.com/me/friends?access_token=#{uri_escape(session[:facebook_access_token])}"
        puts graph_url
        r = RestClient.get graph_url
        data = JSON.parse(r.to_s)
        user_friends = data["data"]
        hashids = []
        user_friends.each{|tmp| hashids << tmp['id']}
        hashids << session[:facebook_id]
        @posts = UsersProductsWantedAction.all(:conditions => {:user_id => hashids.sort}, :order => "updated_at DESC")
        p @posts
    else
      @posts = []
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    bool = false
    @product = Product.new(params[:product])
    if isLoggedIn?
      if @product.save
        upwa = UsersProductsWantedAction.new(:product_id => @product.id, :user_id => session[:facebook_id], :wanted_action_id => params[:wanted_action][:id])
        bool = true if upwa.save  
      end   
    end
    respond_to do |format|
      if bool
        format.html { redirect_to :root, notice: 'Post successful...' }
        format.json { render json: @product, status: :created, location: @product }
      else
        @product.errors.add :base, "You must login..."
        format.html { render action: "index" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end
