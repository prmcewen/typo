class SessionsController < ApplicationController

def create
  auth = request.env["omniauth.auth"]
  @social = Social.find_by_provider_and_uid(auth["provider"], auth["uid"]) || Social.create_with_omniauth(auth)
  @social.token = auth["credentials"]["token"]
  if auth["credentials"].has_key?("expires_at")
    require 'date'
    tokendate = auth["credentials"]["expires_at"].to_s
    @social.expires_at = DateTime.strptime(tokendate,'%s')
  end
  @social.save
  session[:social_id] = @social.id
  flash[:notice] = _(auth.to_s) #"Successfully Authorized Facebook")
  redirect_to '/admin/shows#index' 
end

def destroy
  session[:social_id] = nil
  redirect_to root_url, :notice => "Signed out!"
end

end
