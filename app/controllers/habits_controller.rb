class HabitsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :load_habit, only: %i[show destroy]

  def index
    @habits = Habit.all
  end

  def show
    @habit
  end

  def new
    @habit = current_user.habits.new
  end

  def create
    @habit = current_user.habits.new(params_habit)

    if @habit.save
      redirect_to @habit, notice: 'Your habit successfully created.'
    else
      flash[:errors] = @habit.errors.full_messages
      render :new
    end
  end

  def destroy
    if current_user.author_of?(@habit)
      @habit.destroy
      redirect_to habits_path, notice: 'Your habit successfully deleted.'
    else
      render :show, notice: 'You must be the author to delete the habit.'
    end
  end

  private

  def params_habit
    params.require(:habit).permit(:title, :description)
  end

  def load_habit
    @habit = Habit.find(params[:id])
  end
end
