class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
    @student = Student.find(params[:student_id])
    @lesson = @student.lessons.new
  end

  def edit
    @lesson = Lesson.find(params[:id])
    @student = @lesson.student
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @student = @lesson.student
    @lesson.destroy
    redirect_to student_path(@student), notice: "La leçon a bien été supprimée."
  end

  def create
    @student = Student.find(params[:student_id])
    @lesson = @student.lessons.new(lesson_params)
    if @lesson.save
      redirect_to student_path(@student), notice: "Leçon ajoutée avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @lesson = Lesson.find(params[:id])
    @student = @lesson.student
    if @lesson.update(lesson_params)
      redirect_to student_path(@student), notice: "Leçon modifiée avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :date, :notes)
  end
end
