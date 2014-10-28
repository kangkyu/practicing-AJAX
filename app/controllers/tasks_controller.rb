class TasksController < ApplicationController
  def index
    # sleep 2
    @complete_tasks = Task.where(complete: true)
    @incomplete_tasks = Task.where(complete: false)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.js
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.js
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.js
    end
  end

  private
  def task_params
    params.require(:task).permit(:name, :complete)
  end
end