class Job < ApplicationRecord
  belongs_to :user
  has_many :resumes
  has_many :favorites
  has_many :member, through: :favorites, source: :user

  scope :published, -> { where(is_hidden: false) }
  scope :recent, -> { order("created_at DESC") }
  scope :random3, -> { limit(3).order("RANDOM()")}
end
