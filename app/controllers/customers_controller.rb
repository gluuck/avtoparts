class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show edit update destroy]

  def new
    @customer = Customer.new
  end

  def show

  end

  def create
    @customer = Customer.new(customer_params)
    respond_to do |format|
      if @customer.save
        format.html { redirect_to customer_url(@customer), notice: "Customer was successfully created." }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def customer_params
    params.fetch(:customer, {}).permit(:name)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
