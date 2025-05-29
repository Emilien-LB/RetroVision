class RemindersController < ApplicationController
  before_action :set_lesson

  def index
    @reminders = Reminder.all
  end

  def show
    @reminder = Reminder.find(params[:id])
  end

  def new
    @reminder = Reminder.new
  end

  def edit
    @reminder = @lesson.reminders.find(params[:id])
  end

  def update
    @reminder = @lesson.reminders.find(params[:id])
    if @reminder.update(reminder_params)
      redirect_to student_path(@lesson.student), notice: "Rappel modifié."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @reminder = @lesson.reminders.find(params[:id])
    @reminder.destroy
    redirect_to student_path(@lesson.student), notice: "Rappel supprimé."
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @reminder = @lesson.reminders.new(reminder_params)
    if @reminder.save
      redirect_to student_path(@lesson.student), notice: "Rappel ajouté."
    else
      redirect_to student_path(@lesson.student), alert: "Erreur lors de l'ajout du rappel."
    end
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  def reminder_params
    params.require(:reminder).permit(:title, :date, :success_rate)
  end
end
