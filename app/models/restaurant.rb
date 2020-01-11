class Restaurant < ApplicationRecord
  has_many :lunches, dependent: :destroy
  has_many :breakfasts, dependent: :destroy
  belongs_to :user, optional: true
  mount_uploader :image, ImageUploader
  paginates_per 4

  accepts_nested_attributes_for :lunches, reject_if: :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :breakfasts, reject_if: :all_blank, :allow_destroy => true
end
