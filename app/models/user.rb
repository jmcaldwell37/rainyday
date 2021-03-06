class User < ApplicationRecord
  # Direct associations

  has_many   :memberships,
             :dependent => :destroy

  has_many   :customized_preferences,
             :dependent => :destroy

  has_many   :goals,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
