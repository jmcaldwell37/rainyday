require 'rails_helper'

RSpec.describe Event, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:customized_preferences) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
