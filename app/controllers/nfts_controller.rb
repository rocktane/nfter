class NftsController < ApplicationController

  def index
    @nfts = Nft.all
  end

  def show
    @nft = Nft.find(params[:id])
    @transaction = Transaction.new
    @disabled_dates = @nft.transactions.flat_map { |transaction| (transaction.begin_date.to_date..transaction.end_date.to_date).map { |date| date.strftime('%Y-%m-%d') }}
  end

  def new
    @nft = Nft.new
  end

  def create
    @nft = Nft.new(nft_params)
    @nft.user = current_user
    if @nft.save!
      redirect_to nft_path(@nft)
    else
      render 'new'
    end
  end

  def edit
    @nft = Nft.find(params[:id])
  end

  def update
    @nft = Nft.find(params[:id])
    if @nft.update(nft_params)
      redirect_to nft_path(@nft)
    else
      render 'edit'
    end
  end

  def destroy
    @nft = Nft.find(params[:id])
    @nft.destroy
    redirect_to root_path
  end

  private

  def nft_params
    params.require(:nft).permit(:name, :description, :price, :availability, :photo)
  end
end
