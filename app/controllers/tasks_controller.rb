class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.by_status(current_user.id)
    @new_task = Task.new
  end

  def edit
    respond_to do |format|
      format.js { render 'edit.js.erb' }
    end
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    
    if @task.save
      redirect_to tasks_path, notice: 'Tarefa criada com sucesso!'
    else
      render :new
    end

  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update

    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Tarefa atualizada com sucesso!'
      #tasks_path, notice: 'Tarefa atualizada com sucesso.'
    else
      render :edit
    end

  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.deleted_at = Time.now
    if @task.save
      redirect_to tasks_url, notice: 'Tarefa excluída com sucesso.'
    else
      redirect_to tasks_url, notice: 'Ocorreu um erro ao excluir a tarefa.'
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :description, :deadline, :status)
    end
end
