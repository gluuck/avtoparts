class ServicesController < ApplicationController
  before_action :set_service, only: %i[ show edit update destroy ]

  def show
  end

  def new
    @order ||= Order.find(params[:order_id])
    @service = @order.services.build
  end

  def create
    @order ||= Order.find(params[:order_id])

    @service = @order.services.build(service_params)
    respond_to do |format|
      if @service.save
        format.html { redirect_to @service.order, notice: "Service was successfully created." }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service.order, notice: "Servise was successfully updated." }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to  @service.order, notice: "Servise was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_service
    @service ||= Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:order_id, :service_type)
  end
end
