class TasksController < ApplicationController
  respond_to :html, :js
  def new
    @task = Task.new
    authorize @task
  end

  def create
    @task = current_user.tasks.build(task_params)
    @task.expires_at = Time.now + 7.days
    authorize @task
    if @task.save
      flash[:notice] = 'Your new Task was saved'
    else
      flash[:error] = "Your Task cannot be blank"
    end

    respond_with(@task) do |f|
      f.html { redirect_to tasks_path}
    end
  end

  def show
    @task = Task.find(params[:id])
    authorize @task
  end

  def index
    #@tasks = current_user.tasks.where("expires_at >= ? AND completed == ?", Time.now, false)
    @inactive_tasks = current_user.tasks.where("expires_at <= ? OR completed = ?", Time.now, true)
    @tasks = current_user.tasks.where("expires_at >= ?", Time.now).where(completed: false)
    ######@inactive_tasks = current_user.tasks.where(completed: true)
    #returns an array @tasks = current_user.tasks.select {|t| (t.expires_at >= Time.now) && (t.completed == false)}
    authorize @tasks
    authorize @inactive_tasks
  end

  def update
  end

  def destroy
    @task = current_user.tasks.find(params[:id])

    if @task.destroy
      redirect_to tasks_path, notice: "Task was sucessfully deleted"
    else
      flash[:error] = "There was an error deleting your task"
      redirect_to @tasks
    end
  end

  def complete
    @task = current_user.tasks.find(params[:task_id])
    @task.completed = true
    if @task.save
      redirect_to tasks_path, notice: "Task completed!"
    else
      flash[:error] = "Task failed to complete"
      redirect_to tasks_path
    end
  end

  def clear
    @task = current_user.tasks.remove_inactive
    redirect_to tasks_path, notice: "Inactive tasks removed successfully"
  end

  #private methods
  private

  def task_params
    params.require(:task).permit(:description)
  end

end