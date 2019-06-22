class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    post = Micropost.find(params[:like_id])
    current_user.pet(post)
    flash[:success] = 'お気に入りに登録しました'
    redirect_to post.user
  end

  def destroy
    post = Micropost.find(params[:like_id])
    current_user.unpet(post)
    flash[:success] = 'お気に入りに解除しました'
    redirect_to post.user
  end
end
