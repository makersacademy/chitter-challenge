
class Chitter < Sinatra::Base

  get '/users/sign_up' do
    @user = User.new
    erb :'users/sign_up'
  end

  post '/users' do
    @user = User.create(username: params[:username],
                     email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect('/links')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/sign_up'
    end
  end

end
