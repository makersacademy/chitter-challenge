class Chitter < Sinatra::Base
  get '/users/sign-up' do
    @user = User.new
    erb :sign_up
  end

  post '/users' do
    @user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/chitter')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :sign_up
    end
  end
end
