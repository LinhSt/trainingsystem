class TasksController < ApplicationController
  before_action :load_task, only: :destroy
  def index
  end

  def show
  end

  def create
    @task = Task.new(task_params)
    @task.save

  end

  def destroy
    @task.destroy
  end
  private
    def task_params
      params.require(:task).permit :name, :subject_id
    end

    def load_task
      @task = Task.find_by id: params[:id]
      return if @task
      flash[:danger] = t "controller.user.error_id"
      redirect_to root
    end
end
