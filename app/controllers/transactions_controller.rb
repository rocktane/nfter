class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:validate, :refuse]

  def create
    @nft = Nft.find(params[:nft_id])
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      redirect_to profile_path(@transaction.nft_id)
    else
      render :new, status: :unprocessable_entity
    end
  end

   private

  def transaction_params
    params.require(:transaction).permit(:name, :photos)
  end

  def set_transaction
    @transaction = Transaction.find(params[:transaction_id])
  end
end
