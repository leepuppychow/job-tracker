class JobsController < ApplicationController
  def index
    if params[:sort] == "location"
      @jobs = Job.sorted_by_location
      render :"dashboard/location"
    elsif params[:sort] == "interest"
      @jobs = Job.sorted_by_level_of_interest
      render :"dashboard/interest"
    elsif params[:location]
      @city = params[:location]
      @jobs = Job.jobs_in_city(@city)
      render :"dashboard/jobs_in_city"
    elsif params[:sort].nil?
      redirect_to root_path
    end
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
    @categories = Category.all
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @job.update(job_params)
    if @job.update(job_params)
      flash[:success] = "You edited #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def destroy
    company = Company.find(params[:company_id])
    job = Job.find(params[:id])
    job.destroy
    flash[:success] = "#{job.title} was successfully deleted!"
    redirect_to company_path(company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end

end
