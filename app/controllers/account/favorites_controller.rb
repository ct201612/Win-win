class Account::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @favorites = Favorite.where(user_id: @user).order("created_at DESC").paginate(page: params[:page], per_page: 5)
    @recommended = Job.published.random3
  end
end
