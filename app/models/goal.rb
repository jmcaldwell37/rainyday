class Goal < ApplicationRecord
  # Direct associations

  has_many   :customized_preferences,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
