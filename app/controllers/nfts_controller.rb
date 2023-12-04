class NftsController < ApplicationController
  def index
    @nfts = Nft.all
  end

  def show
    @nft = Nft.find(params[:id])
  end

  def new
    @nft = Nft.new
  end

  def create
    @nft = Nft.new(nft_params)
    if @nft.save
      redirect_to @nft
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
      redirect_to @nft
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
    params.require(:nft).permit(:name, :description, :price, :availibility)
  end
end
