Company.destroy_all
Job.destroy_all

COMPANIES = ["ESPN", "Aetna", "United Airlines", "Denver Public Schools", "Shopify", "Starbucks", "Pivotal Labs", "Captain U"]
JOBS = ["Engineering", "Development", "Dev Ops", "Quality Assurance", "Teacher", "Product Manager", "Consultant", "Community Manager"]
CITIES = ["Seattle", "Denver", "Portland", "Indianapolis", "Madison", "Orlando", "San Diego", "Austin", "Las Vegas", "Little Rock", "Boise", "Eugene", "Oakland"]
CATEGORIES = ["Technology", "Business", "Engineering", "Education", "Human Resources"]

CATEGORIES.each do |title|
  category = Category.create!(title: title)
  puts "Created #{category.title}"
end

COMPANIES.each do |name|
  company = Company.create!(name: name)
  puts "Created #{company.name}"
  10.times do |num|
    company.jobs.create!(title: JOBS.sample,
                description: "What a great position!",
                level_of_interest: num + rand(100),
                city: CITIES.sample,
                category_id: 1+rand(5))
    puts "  Created #{company.jobs[num].title}"
  end
end
