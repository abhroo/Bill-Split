class ExpencesController < ApplicationController
  # GET /expences
  # GET /expences.json
  def index
    @expences = Expence.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @expences }
    end
  end

  # GET /expences/1
  # GET /expences/1.json
  def show
    @expence = Expence.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @expence }
    end
  end

  # GET /expences/new
  # GET /expences/new.json
  def new
    @expence = Expence.new
    @users = []
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @expence }
    end
  end

  # GET /expences/1/edit
  def edit
    @expence = Expence.find(params[:id])
  end

  # POST /expences
  # POST /expences.json
  def create
    @expence = Expence.new(params[:expence])
    user_keys = params[:expences].keys
    user_values = params[:expences].values
    amount_values = params[:amount].values
    
    respond_to do |format|
      if @expence.save
        user_keys.each_with_index do |key, ind|
          ExpencesDetail.create(:user_id=>key.split("_")[1], :expence_id=>@expence.id, :amount=>amount_values[ind]) if user_values[ind]=="1"  
        end
        format.html { redirect_to @expence, notice: 'Expence was successfully created.' }
        format.json { render json: @expence, status: :created, location: @expence }
      else
        format.html { render action: "new" }
        format.json { render json: @expence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /expences/1
  # PUT /expences/1.json
  def update
    @expence = Expence.find(params[:id])

    respond_to do |format|
      if @expence.update_attributes(params[:expence])
        format.html { redirect_to @expence, notice: 'Expence was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @expence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expences/1
  # DELETE /expences/1.json
  def destroy
    @expence = Expence.find(params[:id])
    @expence.destroy

    respond_to do |format|
      format.html { redirect_to expences_url }
      format.json { head :no_content }
    end
  end
  
  def load_users
    @users = User.where("id in (?)", UserGroup.where(:group_id=>params[:id]).pluck(:user_id))
    
    respond_to do |format|
      format.html { render :partial => "load_users" }
    end
  end
end
