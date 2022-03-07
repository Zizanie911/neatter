class Day < ApplicationRecord
  validates :today, presence: true
  belongs_to :user

  before_create :set_today_value

  def set_today_value
    self.today = Date.today unless self.today.present?
  end
end
