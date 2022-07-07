require 'factory_bot'
5.times do
  Customer.create(name: Faker::Name.name)
  Executor.create(name: Faker::Name.name)
end
Category.create(category_type: 'soft')
Category.create(category_type: 'medium')
Category.create(category_type: 'hard')
Category.create(category_type: 'super hard')
Category.create(category_type: 'extra hard')
