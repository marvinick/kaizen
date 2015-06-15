class ImprovesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:edit, :update, :destroy]

  def index
    @improves = Improve.all.reverse
  end

  def edit
    @improve = @improve.item
  end

  def create
    @improve = current_user.improves.new(improve_params)
    if @improve.save
      redirect_to item_path(@improve.item), notice: "Improvement was created"
    else
      render :new, notice: "Something is wrong"
    end
  end

  def update
    if @improve.update(improve_params)
      redirect_to item_path(@improve.item), notice: 'Improve was updated'
    else
      render :new, notice: "Something is wrong"
    end
  end

  def destroy
    @improve.destroy
    redirect_to item_path(@improve.item), notice: "Improve was deleted"
  end

  private

  def set_improve
    @improve = Improve.find(params[:id])
  end

  def improve_params
    params.require(:improve).permit(:flavor, :taste, :texture, :portion, :aroma)
  end
end