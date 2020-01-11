class Breakfast < ApplicationRecord
  belongs_to :restaurant, optional: true
end
