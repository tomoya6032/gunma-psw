class TimelinesController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
  end

  def show
    user_ids = current_user.followings.pluck(:id)
    @articles = Article.where(user_id: user_ids)
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
