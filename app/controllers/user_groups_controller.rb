class UserGroupsController < ApplicationController
  # GET /user_groups
  # GET /user_groups.json
  def index
    @user_groups = UserGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_groups }
    end
  end

  # GET /user_groups/1
  # GET /user_groups/1.json
  def show
    @user_group = UserGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_group }
    end
  end

  # GET /user_groups/new
  # GET /user_groups/new.json
  def new
    @user_group = UserGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_group }
    end
  end

  # GET /user_groups/1/edit
  def edit
    @user_group = UserGroup.find(params[:id])
  end

  # POST /user_groups
  # POST /user_groups.json
  def create
    @user_ids = params[:user_group][:user_id].drop(1) if !params[:user_group][:user_id].blank?
    @create_obj = []
    @user_ids.each do |id|
       @create_obj << {:group_id=>params[:user_group][:group_id], :user_id=>id}
     end  
    @user_group = UserGroup.create(@create_obj)
    respond_to do |format|
      if !@user_group.blank?
        format.html { redirect_to :action=>"index", notice: 'User group was successfully created.' }
        format.json { render json: @user_group, status: :created, location: @user_group }
      else
        format.html { render action: "new" }
        format.json { render json: @user_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_groups/1
  # PUT /user_groups/1.json
  def update
    @user_group = UserGroup.where(group_id:params[:user_group][:group_id])
    @user_group.destroy_all
    @user_ids = params[:user_group][:user_id].drop(1) if !params[:user_group][:user_id].blank?
    @create_obj = []
    @user_ids.each do |id|
       @create_obj << {:group_id=>params[:user_group][:group_id], :user_id=>id}
     end  
    @user_group = UserGroup.create(@create_obj)
    respond_to do |format|
      if !@user_group.blank?
        format.html { redirect_to :action=>"index", notice: 'User group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_groups/1
  # DELETE /user_groups/1.json
  def destroy
    @user_group = UserGroup.find(params[:id])
    @user_group.destroy

    respond_to do |format|
      format.html { redirect_to user_groups_url }
      format.json { head :no_content }
    end
  end
end
