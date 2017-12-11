class AddCategoriesToJobs < ActiveRecord::Migration[5.1]
  def change
    add_reference :jobs, :categories, foreign_key: true
  end
end
