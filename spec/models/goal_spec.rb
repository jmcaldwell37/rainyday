require 'rails_helper'

RSpec.describe Goal, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:customized_preferences) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
