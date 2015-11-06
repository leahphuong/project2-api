#
class ApplicationController < ActionController::API
  # Defaults for API requests
  #all the methods = actions, this method authenticate will run before any other action run
  #check for token, must return true if you want any of your crud action to happen.
  before_action :api_request_settings
  def api_request_settings
    request.format = :json
  end

  # Use Token Authentication
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate
  def authenticate
    #Rails check for the token header and parse it out
    #get the token out of the header and look up the user by the token
    #if passed => become the current user
    @current_user = authenticate_or_request_with_http_token do |token, _opts|
      User.find_by token: token
    end
  end
  # Controllers can use this to authorize actions
  attr_reader :current_user

  # Require SSL for deployed applications
  force_ssl if: :ssl_configured?
  def ssl_configured?
    !Rails.env.development?
  end

  # Use enhanced JSON serialization
  # make it easier to generate json
  include ActionController::Serialization

  # return 404 for failed search by id
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  def record_not_found
    #by default, get an error message
    render json: { message: 'Not Found' }, status: :not_found
  end

  # Restrict visibility of these methods
  private :authenticate, :current_user, :record_not_found
  private :ssl_configured?, :api_request_settings
end
