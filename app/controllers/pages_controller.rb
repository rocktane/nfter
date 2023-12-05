class PagesController < ApplicationController
  def show
    if user_signed_in?
    @nfts = Nft.where(user_id: current_user)
    @transactions = Transaction.where(nft_id: current_user)
    else
      redirect_to new_user_session_path
    end
  end

  def validate
    @transaction = Transaction.find(params[:id])
    @transaction.state = 'validate'
    redirect_to profile_path(@transaction.nft_id.user_id)
  end

  def refuse
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    redirect_to profile_path(@transaction.nft_id.user_id)
  end
end
