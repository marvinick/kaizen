class PagesController < ApplicationController
    before_action :authenticate_user!, only: [:dashboard]

  def home
    if current_user
      redirect_to dashboard_path
    end
  end

  def dashboard
    @user = current_user
    @items = @user.items
    @comments = @user.comments.limit(10).reverse
  end
end
