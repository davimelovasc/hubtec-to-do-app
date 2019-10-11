class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:edit, :update, :destroy]

  def index
    @tasks = Task.by_status(current_user.id)
    @new_task = Task.new
  end

  def edit
    respond_to do |format|
      format.js { render 'edit.js.erb' }
    end
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id

    if @task.save
      redirect_to tasks_path, notice: 'Tarefa criada com sucesso!'
    else
      flash.now[:notice] = @task.errors.full_messages.to_sentence
      @tasks = Task.by_status(current_user.id)
      @new_task = @task
      render :index
    end

  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Tarefa atualizada com sucesso!'
    else
      flash.now[:notice] = @task.errors.full_messages.to_sentence
      @tasks = Task.by_status(current_user.id)
      render :index
    end

  end

  def destroy
    if @task.soft_delete
      redirect_to tasks_url, notice: 'Tarefa excluída com sucesso.'
    else
      @tasks = Task.by_status(current_user.id)
      redirect_to tasks_url, notice: 'Ocorreu um erro ao excluir a tarefa.'
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :description, :deadline, :status)
    end

end
