module JobsHelper
  # 显示/隐藏icon #
  def render_job_status(job)
    if job.is_hidden
      "fa fa-lock"
    else
      "fa fa-globe"
    end
  end

  # 职位类型icon #
  def render_job_category(job)
    if job.category == '技术'
      "fa fa-laptop"
    elsif job.category == '财务'
      "fa fa-tasks"
    elsif job.category == '设计'
      "fa fa-photo"
    elsif job.category == '运营'
      "fa fa-line-chart"
    elsif job.category == '市场'
      "fa fa-pie-chart"
    elsif job.category == '销售'
      "fa fa-cny"
    else
      "fa fa-address-book-o"
    end
  end

  # 薪水区间 #
  def render_job_wage(job)
    "#{job.wage_lower_bound} k ~ #{job.wage_upper_bound} k"
  end

  # 投递过简历icon #
  def render_job_resumes(job)
    if job.resumes.count > 0
      "fa fa-envelope-open-o"
    else
      "fa fa-envelope-o"
    end
  end

  # 有人收藏icon #
  def render_job_favorites(job)
    if job.favorites.count > 0
      "fa fa-heart"
    else
      "fa fa-heart-o"
    end
  end

end
