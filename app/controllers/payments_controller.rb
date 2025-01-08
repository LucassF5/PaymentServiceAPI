class PaymentsController < ApplicationController
  def index
    @payments = Payment.all
    render json: @payments
  end

  def create
    @payment = Payment.new(payment_params)

    if @payment.save
      render json: { message: "Pagamento registrado com sucesso!" }, status: :created
    else
      puts @payment.errors.full_messages
      render json: { errors: @payment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :card_number, :valid_date, :security_code, :amount)
  end
end
