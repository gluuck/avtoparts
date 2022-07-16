class BaseQuery
  attr_reader :orders

  def initialize(orders = Order.all)
    @orders = orders
  end

  def call(options)
    query(options)
	end

  private

  def query(options)
    options[:service].nil? ? orders.where(options.select{|k,v| k unless v.nil?}) : orders.where(id: options[:service].order(1))
  end
end
