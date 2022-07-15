class BaseQuery
  attr_reader :orders

  def initialize(orders = Order.all, params = {})
    @orders = orders
    @customer = params[:customer]
  end

  def call(customer: nil, category: nil, executor: nil, service: nil )
    # if customer.present? && category.nil? && executor.nil? && service.nil?
    #   customer(customer)
    # elsif customer.nil? && category.present? && executor.nil? && service.nil?
    #   category(category)
    # elsif customer.nil? && category.nil? && executor.present? && service.nil?
    #   executor(executor)
    # elsif customer.present? && category.present? && executor.present? && service.nil?
      one_field(customer, category, executor, service)
    # elsif customer.nil? && category.nil? && executor.nil? && service.present?
    #   service(service)
    # end
	end

  private

  def one_field(customer, category, executor, service)
    orders.where(customer: customer)
                .or(orders.where(executor: executor))
                .or(orders.where(category: category))
                .or(service(service))
  end

  def service(query)
    orders.where(services: query)
  end
end
