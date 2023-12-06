class PagesController < ApplicationController
  def show
    if user_signed_in?
    @nfts = Nft.where(user_id: current_user)
    @transactions = Transaction.where(state: 'pending', nft: @nfts)
    @current_transactions = Transaction.where(user_id: current_user)
    @renteds = Nft.where(transactions: @current_transactions)
    else
      redirect_to new_user_session_path
    end
  end
end
