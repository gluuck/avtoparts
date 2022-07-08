class BaseQuery
  def call(scope: nil, status: nil)
		scope ||= default_scope
		scope = by_status(scope, status) if status
		scope
	end

  private

	def default_scope
		Order.all
	end

	def by_status(scope, status)
		scope.where(status: status)
	end
end
