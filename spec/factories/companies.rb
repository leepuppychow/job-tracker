FactoryBot.define do
  factory :company do
    name "TestCompany"
    # sequence(:name) {|n| "Company#{n}"}
  end
end
