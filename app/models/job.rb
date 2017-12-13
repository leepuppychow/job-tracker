class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy

  def comments_ordered
    comments.order(created_at: :desc)
  end

  def self.grouped_by_level_of_interest
    group(:level_of_interest).order("level_of_interest DESC").count
  end

  def self.sorted_by_level_of_interest
    order("level_of_interest DESC")
  end

  def self.grouped_by_location
    group(:city).order("count_id DESC").count("id")
  end

  def self.sorted_by_location
    order("city")
  end

  def self.jobs_in_city(city)
    where(city: city)
  end
end
