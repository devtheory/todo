class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(todo_params)
    if @task.save
      redirect_to @task, notice: 'Your new Task was saved'
    else
      flash[:error] = "Your Task cannot be blank"
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def index
    @tasks = Task.all
  end

  #private methods
  private

  def todo_params
    params.require(:task).permit(:description)
  end

end