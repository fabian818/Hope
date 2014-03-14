class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all    
    @message = get_data[:message]
    @specialist_id = get_data[:specialist_id]
    @patient_id = get_data[:patient_id]
  end

  def get_data
    id = session[:id]
    permission = session[:permission]
    p = Person.find(id)
    if permission == 3
      @message = "Paciente"
      @patient_id = p.patient.id
    else
      if permission == 2
        @message = "Especialista"
        @specialist_id = p.specialist.id
      end
    end
     return data = { message: @message, patient_id: @patient_id, specialist_id: @specialist_id}
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
    @message = get_data[:message]
    @patient_id = get_data[:patient_id]
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    if params[:person_id] != nil
      params[:level] = 3
    end
    p = Person.where(login: params[:question][:person_id]).last
    p.id
    @question = Question.new(patient_id: params[:question][:patient_id], person_id: @person_id, title: params[:question][:title], body: params[:question][:body], level: params[:question][:level], reg_date: params[:question][:reg_date])

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render action: 'show', status: :created, location: @question }
      else
        format.html { render action: 'new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:patient_id, :person_id, :title, :body, :level, :reg_date)
    end
end
