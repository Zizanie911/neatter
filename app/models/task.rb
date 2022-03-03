class Task < ApplicationRecord
  attr_accessor :habit

  scope :regular_tasks, -> { where(days: nil) }
  scope :habits, -> { where.not(days: nil) }
  scope :done, -> { where(mark_as_done: true) }
  scope :not_done, -> { where(mark_as_done: false) }

  belongs_to :user

  validates :name, presence: true

  before_create :set_default_start_at
  def set_default_start_at
    return if start_at.present?

    self.start_at = Date.today
  end
end
