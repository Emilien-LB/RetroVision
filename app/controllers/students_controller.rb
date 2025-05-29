class StudentsController < ApplicationController
  def index
    @students = Student.all
    @students = @students.order(:last_name, :first_name) if @students.any?
    @students = @students.page(params[:page]) if @students.respond_to?(:page)
  rescue StandardError => e
    flash[:error] = "An error occurred while fetching students: #{e.message}"
    @students = []
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def edit
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path, notice: "Élève ajouté avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to students_path, notice: "Élève modifié avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_path, notice: "Élève supprimé avec succès."
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :permit_date, :result, :gearbox_type, :archived)
  end
end
