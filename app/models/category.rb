class Category < ApplicationRecord
  include PublicActivity::Model
  tracked
  has_many :phrases
  validates :name, presence: true
end
