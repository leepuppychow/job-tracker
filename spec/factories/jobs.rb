FactoryBot.define do
  factory :job do
    title "JobTitle"
    description "JobDescription"
    level_of_interest 60
    city "Denver"
    company #this captures the belongs_to relationship
    category
  end
end
