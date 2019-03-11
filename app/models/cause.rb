class Cause < ApplicationRecord
  # Direct associations

  has_many   :memberships,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
