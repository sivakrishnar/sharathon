class UsersProductsWantedActionsController < ApplicationController
  # GET /users_products_wanted_actions
  # GET /users_products_wanted_actions.json
  def index
    @users_products_wanted_actions = UsersProductsWantedAction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users_products_wanted_actions }
    end
  end

  # GET /users_products_wanted_actions/1
  # GET /users_products_wanted_actions/1.json
  def show
    @users_products_wanted_action = UsersProductsWantedAction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @users_products_wanted_action }
    end
  end

  # GET /users_products_wanted_actions/new
  # GET /users_products_wanted_actions/new.json
  def new
    @users_products_wanted_action = UsersProductsWantedAction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @users_products_wanted_action }
    end
  end

  # GET /users_products_wanted_actions/1/edit
  def edit
    @users_products_wanted_action = UsersProductsWantedAction.find(params[:id])
  end

  # POST /users_products_wanted_actions
  # POST /users_products_wanted_actions.json
  def create
    @users_products_wanted_action = UsersProductsWantedAction.new(params[:users_products_wanted_action])

    respond_to do |format|
      if @users_products_wanted_action.save
        format.html { redirect_to @users_products_wanted_action, notice: 'Users products wanted action was successfully created.' }
        format.json { render json: @users_products_wanted_action, status: :created, location: @users_products_wanted_action }
      else
        format.html { render action: "new" }
        format.json { render json: @users_products_wanted_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users_products_wanted_actions/1
  # PUT /users_products_wanted_actions/1.json
  def update
    @users_products_wanted_action = UsersProductsWantedAction.find(params[:id])

    respond_to do |format|
      if @users_products_wanted_action.update_attributes(params[:users_products_wanted_action])
        format.html { redirect_to @users_products_wanted_action, notice: 'Users products wanted action was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @users_products_wanted_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users_products_wanted_actions/1
  # DELETE /users_products_wanted_actions/1.json
  def destroy
    @users_products_wanted_action = UsersProductsWantedAction.find(params[:id])
    @users_products_wanted_action.destroy

    respond_to do |format|
      format.html { redirect_to users_products_wanted_actions_url }
      format.json { head :no_content }
    end
  end
end
