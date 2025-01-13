
class MercadoPagoService
  @mercadopago = Mercadopago::SDK.new(ENV["MERCADOPAGO_ACCESS_TOKEN"])
  def initialize
  end

  def create_payment(params)
    payment_data = {
      token: params[:token],
      transaction_amount: params[:amount].to_f,
      installments: 1,
      payment_method_id: "visa",
      cardholder: {
        name: params[:name]
      },
      payer: {
        email: "test_user_123456@testuser.com"
      }
    }

      payment_response  = @mercadopago.payment.create(payment_data)
      payment_response [:response]
  rescue StandardError => e
    { error: e.message }
  end
end
