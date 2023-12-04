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

  def validate
    pseudo code
    je veux trouver le nft de la transaction, et modifier le
    params nft.transaction.status en non available,
    et supprimer la demande de transaction
  end

  def refuse
    pseudo code
    je veux trouver le nft de la transaction,
    et supprimer la demande de transaction
  end

   private

  def transaction_params
    params.require(:transaction).permit(:name, :photos)
  end

  def set_transaction
    @transaction = Transaction.find(params[:transaction_id])
  end
end
