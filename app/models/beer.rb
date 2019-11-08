class Beer < ApplicationRecord
  # validations
  validates :min_temperature, :max_temperature, presence: true

end
