class TasksController < ApplicationController
  def index
    @complete_tasks = Task.where(complete: true)
    @incomplete_tasks = Task.where(complete: false)
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_url
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_url
  end

  private
  def task_params
    params.require(:task).permit(:name, :complete)
  end
end