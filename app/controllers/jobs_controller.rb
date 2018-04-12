class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:add, :remove]
  before_action :validate_search_key, only: [:search]

  def index
    @jobs = Job.published.recent.paginate(page: params[:page], per_page: 8)
  end

  def show
    @job = Job.find(params([:id]))
    @category = @job.category
    @similarity = Job.where(is_hidden: false, category: @job.category).where.not(id: @job.id).random3
    @resumes = Resume.where(job: @job, user: current_user)
    if @job.is_hidden
      redirect_to root_path, alert: "此职位未开放。"
    end
  end

  def add
    @job = Job.find(params[:id])
    if !current_user.is_member_of?(@job)
      current_user.join!(@job)
    end
    redirect_to :back
  end

  def remove
    @job = Job.find(params[:id])
    if current_user.is_member_of?(@job)
      current_user.quit!(@job)
    end
    redirect_to :back
  end

  def search
    if @q.present?
      search_result = Job.ransack(@search_criteria).result(distinct: true)
      @jobs = search_result.published.paginate(page: params[:page], per_page: 8)
      @recommonded = Job.published.random3
    end
  end

  protected

  def validate_search_key
    @q = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
    @search_criteria = search_criteria(@q)
  end

  def search_criteria(q)
    { name_or_company_or_location_cont: q }
  end
end
