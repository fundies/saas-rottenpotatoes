class ApplicationController < ActionController::Base
  require 'themoviedb'

  before_filter :set_config
  Tmdb::Api.key("77085611c035d045242db5d92db6162f")

  def set_config
  	@configuration = Tmdb::Configuration.new
  end
  
  before_filter :set_current_user
  protected # prevents method from being invoked by a route
  def set_current_user
    # we exploit the fact that find_by_id(nil) returns nil
    @current_user ||= Moviegoer.find_by_id(session[:user_id])
    #redirect_to login_path and return unless @current_user
  end
end
