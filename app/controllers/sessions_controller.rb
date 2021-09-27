class SessionsController < ApplicationController
  def create
    print('huihuihuiHUI\n')
    print(request)
    @user = User.find_or_create_from_auth_hash(auth_hash())
    session[:user_id] = @user.id
    redirect_to root_path
  end

  protected

  def auth_hash
    return request.env['omniauth.auth']

  end

  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = "Successfully logged out!"
    end
    redirect_to root_path

  end
end
