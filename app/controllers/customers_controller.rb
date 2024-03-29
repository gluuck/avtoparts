class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show edit update destroy]

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def show
  end

  def create
    @customer = Customer.new(customer_params)
    respond_to do |format|
      if @customer.save
        format.html { redirect_to customers_url, notice: "Customer was successfully created." }
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
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customers_path, notice: "customer was successfully updated." }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to  customers_path, notice: "customer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def customer_params
    params.fetch(:customer, {}).permit(:name)
  end

  def set_customer
    @customer ||= Customer.find(params[:id])
  end
end
