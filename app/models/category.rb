class Category < ApplicationRecord
  has_many :phrases
  validates :name, presence: true
end
