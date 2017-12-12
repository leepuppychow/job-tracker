class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def comments_ordered
    comments.order(created_at: :desc)
  end

  def self.grouped_by_level_of_interest
    group(:level_of_interest).count
  end

  def self.grouped_by_location
    group(:city).count
  end
end
