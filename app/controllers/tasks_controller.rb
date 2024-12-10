class TasksController < ApplicationController
  # READ
  def index
    @tasks = Task.order(:position)
  end

  def show
    task_id = params[:id]
    @task = Task.find(task_id)
  end

  # CREATE
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to(tasks_path)
    else
      render('new')
    end
  end

  # UPDATE
  def edit
    task_id = params[:id]
    @task = Task.find(task_id)
  end

  def update
    task_id = params[:id]
    @task = Task.find(task_id)

    if @task.update(task_params)
      redirect_to(tasks_path)
    else
      render('edit')
    end
  end

  # DELETE
  def delete
    task_id = params[:id]
    @task = Task.find(task_id)
  end

  def destroy
    task_id = params[:id]
    @task = Task.find(task_id)

    @task.destroy
    redirect_to(tasks_path)
  end

  private
  def task_params
    params.require(:task).permit(
      :name,
      :position,
      :completed,
      :description,
      :category_id
    )
  end
end
