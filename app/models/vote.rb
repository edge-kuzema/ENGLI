class Vote < ApplicationRecord
  include PublicActivity::Model
  tracked
end