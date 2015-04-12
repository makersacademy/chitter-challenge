class Chitter

  get '/reset_password' do
    if !(params[:email])
      erb :"reset_password/request"
    else
      user = User.first(email: params['email'])
      user.password_token = (1..64).map { ('A'..'Z').to_a.sample }.join
      user.password_token_timestamp = Time.now
      user.save
      erb :"reset_password/response"
    end
  end

  get '/reset_password/:token' do
    user = User.first(password_token: params[:token])
    if Time.now > user.password_token_timestamp + (60 * 60)
      flash[:notice] = "Token time has expired!"
    else
      if params[:password]
        user.password = params[:password]
        user.password_confirmation = params[:confirmation]
        user.password_token = nil
        user.password_token_timestamp = nil
        if user.save
          flash[:notice] = "Password changed!"
          redirect to('/')
        else
          flash.now[:errors] = user.errors.full_messages
        end
      else
        @token = params[:token]
        erb :'/reset_password/change_password'
      end
    end
  end

end