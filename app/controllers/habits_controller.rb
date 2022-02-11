class HabitsController < ApplicationController
  def index
    @habits = Habit.all
  end

  def show
  end

  def new
    habit = Habit.new
  end

  def create
    @habit = Habit.new(habit_params)

    if @habit.save
      render :show
    else
      render :new
    end
  end

  private

  def habit
    @habit ||= params[:id] ? Habit.find(params[:id]) : Habit.new
  end

  helper_method :habit

  def habit_params
    params.require(:habit).permit(:title, :description)
  end
end
