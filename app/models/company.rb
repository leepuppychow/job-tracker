class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts

  def self.top_3_ranked_by_avg_level_of_interest
    find_by_sql(
      "SELECT AVG(level_of_interest) AS avg_interest, name FROM companies
      JOIN jobs ON companies.id = jobs.company_id
      GROUP BY name
      ORDER BY avg_interest DESC
      LIMIT 3").pluck(:name)
    # joins(:jobs).group(:name).average(:level_of_interest)
  end
end
