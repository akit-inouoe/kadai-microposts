class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    # micropost.like(current_user)
    like = Like.find_or_initialize_by(user_id: current_user.id, micropost_id: micropost.id)
    like.save
    flash[:success] = 'お気に入りに追加しました'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    micropost.unlike(current_user)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_back(fallback_location: root_url)
  end
end
