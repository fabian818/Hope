class TreatmentsController < ApplicationController
  before_action :set_treatment, only: [:show, :edit, :update, :destroy]

  # GET /treatments
  # GET /treatments.json
  def index
    person_id = session[:id]    
    person_permission = session[:permission]
    if evalue(person_id,person_permission)
      @treatments = evalue(person_id,person_permission)
    else       
      @treatments = nil      
    end    
  end

  def evalue(id,permission)
    begin
      if permission == 3
        p=Person.find(id).patient.treatments
        return p
      else
        if permission == 2
          p=Person.find(id).specialist.treatments
          return p
        else 
          if permission ==1
            p=Treatment.all
            return p
          else
            return false
          end
        end
      end
    rescue
      return false
    end
  end

  def evalue_specialist(id)
    begin
      if p=Person.find(id).specialist.treatments
        return p
      else
        return false
      end
    rescue
      return false
    end
  end
  # GET /treatments/1
  # GET /treatments/1.json
  def show
  end

  # GET /treatments/new
  def new
    @treatment = Treatment.new
    @patients = Patient.all
    @specialists= Specialist.all
    @patient_person = Person.joins("Inner join patients on people.id=patients.person_id")
    @specialist_person = Person.joins("Inner join specialists on people.id=specialists.person_id")
  end

  # GET /treatments/1/edit
  def edit
  end

  # POST /treatments
  # POST /treatments.json
  def create
    @p
    x = Person.where(login: params[:treatment][:patient_id]).last
    
    @patient = x.patient.id
    @treatment = Treatment.new(patient_id: @patient, specialist_id: params[:treatment][:specialist_id], treatment_type: params[:treatment][:treatment_type], start_date: params[:treatment][:start_date], end_date: params[:treatment][:end_date], observation: params[:treatment][:observation])
    
    #@treatment = Treatment.new(treatment_params)

    respond_to do |format|
      if @treatment.save
        format.html { redirect_to @treatment, notice: 'Treatment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @treatment }
      else
        format.html { render action: 'new' }
        format.json { render json: @treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treatments/1
  # PATCH/PUT /treatments/1.json
  def update
    respond_to do |format|
      if @treatment.update(treatment_params)
        format.html { redirect_to @treatment, notice: 'Treatment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treatments/1
  # DELETE /treatments/1.json
  def destroy
    @treatment.destroy
    respond_to do |format|
      format.html { redirect_to treatments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treatment
      @treatment = Treatment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def treatment_params
      params.require(:treatment).permit(:patient_id, :specialist_id, :treatment_type, :start_date, :end_date, :observation)
    end
end
