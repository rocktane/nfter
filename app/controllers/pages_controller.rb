class PagesController < ApplicationController
  def home
  end

  def show
    if user_signed_in? && current_user.transaction.state == 'pending'
      @transactions = Transaction.all
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
