class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def comments_ordered
    comments.order(created_at: :desc)
  end

  def self.grouped_by_level_of_interest
    # find_by_sql("SELECT COUNT(title) AS count, title FROM jobs
    # GROUP BY title ORDER BY count DESC").pluck(:title, :count)
    group(:level_of_interest).order("level_of_interest DESC").count
  end

  def self.grouped_by_location
    group(:city).order("count_id DESC").count("id")
  end

  def self.jobs_in_city(city)
    where(city: city)
  end
end
