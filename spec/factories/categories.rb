FactoryBot.define do
  sequence :categories do |e|
    "category#{e}"
  end  
  factory :category do
    name {generate(:categories)}
  end
end
