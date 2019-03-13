class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  # GET /teachers
  # GET /teachers.json
  def index
    @teachers = Teacher.all.order("id ASC")
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
    @subjects = Subject.all
  end

  # GET /teachers/1/edit
  def edit
    @subjects = Subject.all
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @subjects = Subject.all

    subject_array = params["teacher"]["subject_string"].select{|str| !str.empty?}.map{|index| @subjects.find(index).name}


    params["teacher"]["subject_string"] = subject_array.join(", ")


    @teacher = Teacher.new(teacher_params)

    subject_array.each do |new_subject_name|
      new_subject = TeacherSubject.new
      new_subject.teacher = @teacher
      new_subject.subject = @subjects.where(:name => new_subject_name).first
      new_subject.save
    end

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to teachers_path, notice: 'Teacher was successfully created.' }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    @subjects = Subject.all

    subject_array = params["teacher"]["subject_string"].select{|str| !str.empty?}.map{|index| @subjects.find(index).name}

    params["teacher"]["subject_string"] = subject_array.join(", ")

    existing_teacher_subjects = TeacherSubject.where(:teacher => @teacher)
    existing_teacher_subjects.each do |old_subject|
      old_subject.destroy
    end

    subject_array.each do |new_subject_name|
      new_subject = TeacherSubject.new
      new_subject.teacher = @teacher
      new_subject.subject = @subjects.where(:name => new_subject_name).first
      new_subject.save
    end



    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to teachers_path, notice: 'Teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'Teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_params
      params.require(:teacher).permit(:name, :footnote, :subject_string)
    end
end
