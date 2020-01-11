class Lunch < ApplicationRecord
  belongs_to :restaurant, optional: true
end
