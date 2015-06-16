class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]


  def index
    @items = Item.search(params[:search])
  end

  def show
    @comments = @item.comments
    @comment = Comment.new
  end

  def new
    @item = Item.new
  end

  def edit; end

  def create
    @item = current_user.items.new(item_params)
    @item.save
    redirect_to item_path(@item)
  end

  def update
    @item.update(item_params)
    redirect_to item_path(@item)
  end

  def destroy
    @item.destroy
    redirect_to items
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :description, :gluten, :address, :content, :image, :resource)
    end
end
