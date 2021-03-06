class Spree::Api::BraintreeClientTokenController < Spree::Api::BaseController
  def create
    if params[:payment_method_id]
      gateway = Spree::Gateway::Braintree.find_by!(id: params[:payment_method_id])
    else
      gateway = Spree::Gateway::Braintree.find_by!(active: true)
    end

    render json: { client_token: gateway.generate_client_token, payment_method_id: gateway.id }
  end
end
