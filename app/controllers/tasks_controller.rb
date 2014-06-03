class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    @task.expires_at = @task.created_at + 1.week
    if @task.save
      redirect_to @tasks, notice: 'Your new Task was saved'
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

  def task_params
    params.require(:task).permit(:description)
  end

end