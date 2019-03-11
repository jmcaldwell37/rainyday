class Event < ApplicationRecord
  # Direct associations

  has_many   :customized_preferences,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
