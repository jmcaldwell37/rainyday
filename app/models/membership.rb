class Membership < ApplicationRecord
  # Direct associations

  belongs_to :cause,
             :counter_cache => true

  belongs_to :user

  # Indirect associations

  # Validations

end
