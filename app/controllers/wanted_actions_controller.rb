class WantedActionsController < ApplicationController
  # GET /wanted_actions
  # GET /wanted_actions.json
  def index
    @wanted_actions = WantedAction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wanted_actions }
    end
  end

  # GET /wanted_actions/1
  # GET /wanted_actions/1.json
  def show
    @wanted_action = WantedAction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wanted_action }
    end
  end

  # GET /wanted_actions/new
  # GET /wanted_actions/new.json
  def new
    @wanted_action = WantedAction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wanted_action }
    end
  end

  # GET /wanted_actions/1/edit
  def edit
    @wanted_action = WantedAction.find(params[:id])
  end

  # POST /wanted_actions
  # POST /wanted_actions.json
  def create
    @wanted_action = WantedAction.new(params[:wanted_action])

    respond_to do |format|
      if @wanted_action.save
        format.html { redirect_to @wanted_action, notice: 'Wanted action was successfully created.' }
        format.json { render json: @wanted_action, status: :created, location: @wanted_action }
      else
        format.html { render action: "new" }
        format.json { render json: @wanted_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wanted_actions/1
  # PUT /wanted_actions/1.json
  def update
    @wanted_action = WantedAction.find(params[:id])

    respond_to do |format|
      if @wanted_action.update_attributes(params[:wanted_action])
        format.html { redirect_to @wanted_action, notice: 'Wanted action was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wanted_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wanted_actions/1
  # DELETE /wanted_actions/1.json
  def destroy
    @wanted_action = WantedAction.find(params[:id])
    @wanted_action.destroy

    respond_to do |format|
      format.html { redirect_to wanted_actions_url }
      format.json { head :no_content }
    end
  end
end
