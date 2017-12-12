class Category < ApplicationRecord
  validates :title, presence: true, uniqueness: {case_sensitive: false}
  has_many :jobs, dependent: :destroy
  #dependent: :destroy will delete any of the jobs that have this
  #category's foreign key (cascading delete). Do we want that functionality??

end
