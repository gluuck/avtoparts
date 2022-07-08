class ExecutorsController < ApplicationController
  before_action :set_executor, only: %i[ show edit update destroy ]

  def index
    @executors = Executor.all
  end

  def show
  end

  def new
    @executor = Executor.new
  end

  def edit
  end

  def create
    @executor = Executor.new(executor_params)
    respond_to do |format|
      if @executor.save
        format.html { redirect_to executors_path, notice: "Customer was successfully created." }
        format.json { render :show, status: :created, location: @executor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @executor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @executor.update(executor_params)
        format.html { redirect_to executors_path, notice: "Executor was successfully updated." }
        format.json { render :show, status: :ok, location: @executor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @executor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @executor.destroy
    respond_to do |format|
      format.html { redirect_to  executors_path, notice: "Executor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_executor
    @executor = Executor.find(params[:id])
  end

  def executor_params
    params.require(:executor).permit(:name)
  end
end
