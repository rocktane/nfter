class PagesController < ApplicationController
  def home
  end

  def show
    if user_signed_in?
    @nfts = Nft.where(user_id: current_user)
    @transactions = Transaction.all
    @transactions = Transaction.where(nft_id: current_user)
    end
  end

  def validate_transaction
    @transaction = Transaction.find(params[:id])
    @transaction.update(status: "validated")
    redirect_to pages_show_path
  end

  def refuse_transaction
    @transaction = Transaction.find(params[:id])
    @transaction.update(status: "refused")
    redirect_to pages_show_path
  end
end
