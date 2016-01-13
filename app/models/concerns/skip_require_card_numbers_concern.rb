module SkipRequireCardNumbersConcern
  extend ActiveSupport::Concern
  included do
    prepend(InstanceMethods)
  end

  module InstanceMethods
    def require_card_numbers?
      super && !self.payment_method.kind_of?(Spree::Gateway::BraintreeGateway)
    end
  end
end
