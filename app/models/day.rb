class Day < ApplicationRecord
  validates :date, presence: true
  belongs_to :user
end
