require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:memberships) }

    it { should have_many(:customized_preferences) }

    it { should have_many(:goals) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
