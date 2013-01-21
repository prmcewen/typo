class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
  end

  # This is necessary since Rails 3.0.4
  # See https://github.com/intridea/omniauth/issues/185
  # and http://www.arailsdemo.com/posts/44
  def handle_unverified_request
    true
  end

  
  def create
    omniauth = request.env["omniauth.auth"]
    logger.debug('omni')
    logger.debug(omniauth)
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication
      flash[:notice] = "Signed in successfully."
      logger.debug(' auth ')
      logger.debug( authentication.user )
      authentication.update_attributes( :access_token => omniauth['credentials']['token'] )
      authentication.save
      sign_in_and_redirect(:user, authentication.user)
    elsif current_user
      current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'], :access_token => omniauth['credentials']['token'])
      flash[:notice] = "Authentication successful."
      redirect_to authentications_url
    else
      user = User.new
      user.apply_omniauth(omniauth)
      if user.save
        flash[:notice] = "Signed in successfully."
        sign_in_and_redirect(:user, user)
      else
        session[:omniauth] = omniauth.except('extra')
        redirect_to new_user_registration_url
      end
    end

    logger.debug('CURRENT')
    logger.debug( current_user.authentications[0]['access_token'] ) 
    if( token = current_user.authentications[0]['access_token'] )
      @graph = Koala::Facebook::GraphAPI.new(token)
      @friends = @graph.get_connections("me", "friends")
      logger.debug( 'FRIENDS' )
      logger.debug( @friends )
    end
    
  end
  
  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to authentications_url
  end
end
