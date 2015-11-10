#
class AuthController < ApplicationController
  #skip the action you specify with the condition you specify
  #here you can't authenticate before you register or login
  skip_before_action :authenticate, only: [:login, :register]

  # POST /login
  def login
    @user = User.authenticate credentials[:email], credentials[:password]
    if @user
      #serializer takes your data and serialize it so it can be sent back
      #to front end. this particular action returns the token if the user is valid.

      render json: @user, serializer: LoginUserSerializer, root: 'user'
    else
      head :unauthorized
    end
  end

  # POST /register
  def register
    @user = User.create(credentials)
    #.valid? activerecord model
    if @user.valid?
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /logout/1
  def logout
    #the current token from the front end is no longer usable and it's no way can be saved.
    #check if user id wants to log out is in fact the current user, can't log out someone else.
    if current_user == User.find(params[:id])
      current_user.logout
      #always return header, body is empty
      #if you want to provide information: render json
      head :no_content
    else
      # not allowed to do it
      head :unauthorized
    end
  end

  def credentials
    params.require(:credentials).permit(
      :email,
      :password,
      :password_confirmation)
  end

  private :credentials
end
