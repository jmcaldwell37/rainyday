class CustomizedPreference < ApplicationRecord
  # Direct associations

  belongs_to :goal

  belongs_to :user

  # Indirect associations

  # Validations

end
