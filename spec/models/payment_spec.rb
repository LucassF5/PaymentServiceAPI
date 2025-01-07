require 'rails_helper'

RSpec.describe Payment, type: :model do
  before(:all) do
    @payment = FactoryBot.build(:payment)
  end

  describe 'validations' do
    it "is valid with valid attributes" do
      expect(@payment).to be_valid
    end

    context "name" do
      it "is invalid without a name" do
        @payment.name = nil
        expect(@payment).to be_invalid
      end

      it "is invalid with a name shorter than 3 characters" do
        @payment.name = "Lu"
        expect(@payment).to be_invalid
        expect(@payment.errors.full_messages).to include("Name is too short (minimum is 3 characters)")
      end

      it "is invalid with a name longer than 50 characters" do
        @payment.name = "a" * 52
        expect(@payment).to be_invalid
        expect(@payment.errors.full_messages).to include("Name is too long (maximum is 50 characters)")
      end

      it "is valid with a name between 3 and 50 characters" do
        @payment.name = "Lucas"
        expect(@payment).to be_valid
      end
    end
  end
end
