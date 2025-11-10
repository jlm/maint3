class Minute < ApplicationRecord
  belongs_to :item
  belongs_to :meeting
  belongs_to :minst
end
