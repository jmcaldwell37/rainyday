require 'rails_helper'

RSpec.describe Cause, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:memberships) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
