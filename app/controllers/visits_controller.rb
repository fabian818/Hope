class VisitsController < ApplicationController
  before_action :set_visit, only: [:show, :edit, :update, :destroy]

  # GET /visits
  # GET /visits.json
  def index
    if params[:treatment_id] != nil
    t = Treatment.find(params[:treatment_id])
  else
    t = Treatment.find(session[:treatment_id])
  end
    @visits = t.visits  
  end

  # GET /visits/1
  # GET /visits/1.json
  def show
    
  end

  # GET /visits/new
  def new
    @visit = Visit.new
    session[:treatment_id] = params[:treatment_id]
  end

  # GET /visits/1/edit
  def edit
  end

  # POST /visits
  # POST /visits.json
  def create
    @visit = Visit.new(visit_params)
    @treatment_id = params[:treatment_id]
    session[:treatment_id] = params[:treatment_id]
    respond_to do |format|
      if @visit.save
        format.html { redirect_to @visit, notice: 'Visit was successfully created.', treatment_id: params[:treatment_id] }
        format.json { render action: 'show', status: :created, location: @visit }
      else
        format.html { render action: 'new' }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visits/1
  # PATCH/PUT /visits/1.json
  def update
    respond_to do |format|
      if @visit.update(visit_params)
        format.html { redirect_to @visit, notice: 'Visit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visits/1
  # DELETE /visits/1.json
  def destroy
    @visit.destroy
    respond_to do |format|
      format.html { redirect_to visits_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit
      @visit = Visit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visit_params
      params.require(:visit).permit(:treatment_id, :assistance_date, :visit_type, :observation, :state)

    end
end
