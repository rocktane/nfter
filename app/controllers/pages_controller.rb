class PagesController < ApplicationController
  def show
    if user_signed_in?
    @nfts = Nft.where(user_id: current_user)
    @transactions = Transaction.where(state: 'pending', nft: @nfts)
    else
      redirect_to new_user_session_path
    end
  end
end
