class TransactionsController < ApplicationController

  def create
    @nft = Nft.find(params[:nft_id])
    @transaction = Transaction.new(transaction_params)
    @transaction.nft = @nft
    @transaction.user = current_user
    if @transaction.save!
      redirect_to nft_path(@nft)
    else
      render "nfts/show"
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:begin_date, :end_date)
  end
end
