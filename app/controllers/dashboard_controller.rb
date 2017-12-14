class DashboardController < ApplicationController

  def index
    @jobs_grouped_by_city = Job.grouped_by_location
    @jobs_grouped_by_interest = Job.grouped_by_level_of_interest
    @top_3 = Company.top_3_ranked_by_avg_level_of_interest
  end

end
