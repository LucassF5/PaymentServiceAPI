class PaymentsController < ApplicationController
  before_action :set_mercado_pago_service

  def index
    @payments = Payment.all
    render json: @payments
  end

  def create
    response = @mercado_pago_service.create_payment(payment_params)

    return render json: { error: response[:error] }, status: :bad_request if response[:error]

    @payment = Payment.new(payment_params)
    @payment.save
    render json: @payment, status: :created
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :card_number, :valid_date, :security_code, :amount, :token)
  end

  def set_mercado_pago_service
    @mercado_pago_service = MercadoPagoService.new
  end
end
