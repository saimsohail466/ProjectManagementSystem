class PaymentsController < ApplicationController
  before_action :user_signed?
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
    
  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(project_params)

    if @payment.save
      redirect_to project_path(@payment.project_id), notice: "Payment Adds Scuccessfully.."
    else
      render :form
    end
  end

  def show; end

  def edit; end

  def update
    if @payment.update(project_params)
      redirect_to project_path(@payment.project_id), notice: "Payment update Scuccessfully.."
    end
  end

  def destroy
    redirect_to project_path(@payment.project_id), notice: "Payment delete Scuccessfully.." if @payment.destroy
  end

  private

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def project_params
    params.require(:payment).permit(:title, :description, :amount, :payment_type, :project_id)
  end
end
