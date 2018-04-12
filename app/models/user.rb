class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :jobs
  has_many :resumes
  has_many :favorites
  has_many :favorite_jobs, through: :favorites, source: :job


  def is_member_of?(job)
    favorite_jobs.include?(job)
  end

  def join!(job)
    favorite_jobs << job
  end

  def quit!(job)
    favorite_jobs.delete(job)
  end
end
