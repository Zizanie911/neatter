class Task < ApplicationRecord
  attr_accessor :habit

  scope :regular_tasks, -> { where(days: nil) }
  scope :habits, -> { where.not(days: nil) }
  scope :done, -> { where(mark_as_done: true) }
  scope :not_done, -> { where(mark_as_done: false) }
  scope :past, -> { where("start_at < ?", Time.current) }
  scope :this_week, -> { where("start_at > ?", Time.now.beginning_of_week) }
  scope :today, -> { where("start_at >= ?", Time.now.beginning_of_day).where("start_at <= ?", Time.now.end_of_day) }
  scope :tomorrow, -> { where("start_at >= ?", Time.now.beginning_of_day + 1.day).where("start_at <= ?", Time.now.end_of_day + 1.day) }

  belongs_to :user
  validates :name, presence: true
  before_create :set_default_start_at
  acts_as_taggable_on :tags

  def set_default_start_at
    return if start_at.present?

    self.start_at = Date.today
  end
end
