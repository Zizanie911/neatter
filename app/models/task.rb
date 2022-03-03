class Task < ApplicationRecord
  attr_accessor :habit

  belongs_to :user

  validates :name, presence: true

  before_create :set_default_start_at
  def set_default_start_at
    return if start_at.present?

    self.start_at = Date.today
  end
end
