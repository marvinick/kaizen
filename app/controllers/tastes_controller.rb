class TastesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_taste, only: [:edit, :update, :destroy]

  def edit
    @item = @taste.item
  end

  def create
    @taste = current_user.tastes.new(taste_params)
    if @taste.save
      redirect_to item_path(@taste.item), notice: "Taste was scored"
    else
      render :new, notice: "Something is wrong"
    end
  end

  def update
    if @taste.update(taste_params)
      redirect_to item_path(@taste.item), notice: 'Taste was updated'
    else
      render :new, notice: "Something is wrong"
    end
  end

  def destroy
    @taste.destroy
    redirect_to item_path(@taste.item), notice: "Taste was deleted"

  end

  private

  def set_taste
    @taste = Taste.find(params[:id])
  end

  def taste_params
    params.require(:taste).permit(:content, :item_id, :score)
  end
end