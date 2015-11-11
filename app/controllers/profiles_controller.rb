class ProfilesController < ApplicationController
  def index
    @profiles = current_user.profile

    render json: @profiles
  end

  def show
    @profile = current_user.profile
    render json: @profile
  end

  def create
    @profile = current_user.profile = Profile.create(profile_params)

    if @profile.save
      render json: @profile, status: :created,
        location: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end

  end

  def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      head :no_content
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @profile = current_user.profile
    @profile.destroy

    head :no_content
  end

  private
  def profile_params
    params.require(:profile).permit(:surname, :given_name)
  end
end
