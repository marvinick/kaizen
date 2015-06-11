class TexturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_texture, only: [:edit, :update, :destroy]

  def edit
    @item = @texture.item
  end

  def create
    @texture = current_user.textures.new(texture_params)
    if @texture.save
      redirect_to item_path(@texture.item), notice: "Taste was scored"
    else
      render :new, notice: "Something is wrong"
    end
  end

  def update
    if @texture.update(texture_params)
      redirect_to item_path(@texture.item), notice: 'Taste was updated'
    else
      render :new, notice: "Something is wrong"
    end
  end

  def destroy
     @texture.destroy
    redirect_to item_path(@texture.item), notice: "Taste was deleted"

  end

  private

  def set_texture
    @taste = Taste.find(params[:id])
  end

  def texture_params
    params.require(:texture).permit(:content, :item_id, :score)
  end
end