class Minute < ApplicationRecord
  belongs_to :item
  belongs_to :meeting
  belongs_to :minst
  validates :date, presence: true, unless: -> { Maint3::Config::Importing }
  scope :date_valid, -> { where.not(date: nil) }
end
