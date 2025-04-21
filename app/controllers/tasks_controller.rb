class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end

    def new
      @task = Task.new
    end

    def create
        @task = Task.new(task_params)
        if @task.save
          redirect_to tasks_path  # ✅ works
        else
          puts @task.errors.full_messages
          render :new, status: :unprocessable_entity
        end
      end


    private
    def set_task
        @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :description)
    end
end
