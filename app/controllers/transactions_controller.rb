class TransactionsController < ApplicationController

  def create
    @nft = Nft.find(params[:nft_id])
    @transaction = Transaction.new(transaction_params)
    @transaction.nft = @nft
    @transaction.user = current_user
    if @transaction.save!
      redirect_to nft_path(@nft)
      flash[:notice] = "Your demand has been sent!"
    else
      render "nfts/show"
    end
  end

  def validate
    raise
    @transaction = Transaction.find(params[:id])
    @transaction.update(status: "validated")
    redirect_to pages_show_path
  end

  def refuse
    @transaction = Transaction.find(params[:id])
    @transaction.update(status: "refused")
    redirect_to pages_show_path
  end

  private

  def transaction_params
    params.require(:transaction).permit(:begin_date, :end_date)
  end
end
