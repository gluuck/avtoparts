class ReportsController < ApplicationController
  before_action :set_report, only: %i[show update delete]
  def new
    @report = Report.new
  end

  def xlsx
    # byebug
    @report =Report.find(params[:report_id])
    render xlsx: "show"
  end

  def show
  end

  def create

    @report =  Report.new(report_params)
    if @report.save
      @report.orders.push(query)
      redirect_to @report
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def report_params
    params.require(:report).permit(:title)
  end

  def set_report
    @report =Report.find(params[:id])
  end

  def query
    executor = Executor.where('name LIKE ?', params[:report][:executor] + '%')
                              .take unless params[:report][:executor].empty?
    customer = Customer.where('name LIKE ?', params[:report][:customer] + '%')
                              .take unless params[:report][:customer].empty?
    category = Category.where('category_type LIKE ?', params[:report][:category] + '%')
                              .take unless params[:report][:category].empty?
    service =  Service.where('service_type LIKE ?', params[:report][:service] + '%'
                            ) unless params[:report][:service].empty?

    query =    BaseQuery.new.call(customer: customer,
                                  executor: executor,
                                  category: category,
                                  service: service)
  end
end
