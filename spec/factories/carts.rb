FactoryBot.define do
  factory :cart do
    product { create(:product) }
    user { create(:user) }
  end
end
