require 'spec_helper'

describe Spree::CreditCard, type: :model do
  context "payment is of type Spree::Gateway::BraintreeGateway" do
    let(:payment_method) do
      Spree::Gateway::BraintreeGateway.create!(
        name: 'Braintree Gateway',
        active: true
      )
    end
    it "validate presence of name on create" do
      expect do
        FactoryGirl.create(:credit_card,
          payment_method: payment_method,
          name: nil
        )
      end.to raise_error(ActiveRecord::RecordInvalid, /Name can't be blank/)
    end
  end
end
