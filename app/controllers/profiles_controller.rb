class ProfilesController < ApplicationController
    # before_action :set_profile, only: [:show]
    before_action :authenticate_user!
 
    def index
      

    end
    
    
    def show
      @profile = Profile.find_by(user_id: params[:user_id])
      @profile = current_user.profile

    end
    
    
    def new 
    
    
    end
    
    
    def create
    
    
    end
    
    
    def edit
      @profile = current_user.prepare_profile
    
    end
    
    
    def update
      @profile = current_user.prepare_profile
      @profile.assign_attributes(profile_params)
      if @profile.save
        redirect_to profile_path, notice: 'プロフィール更新！'
      else
        flash.now[:error] = '更新できませんでした'
        render :edit
      end
    end

    
  
    def destroy
    
    
    end

    private
    def profile_params
      params.require(:profile).permit(
          :nickname,
          :introduction,
          :gender,
          :birthday,
          :subscribed,
          :avatar
      )
    end

    
end