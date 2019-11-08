class Beer < ApplicationRecord
  # validations
  validates :style, :min_temperature, :max_temperature, presence: true

end
