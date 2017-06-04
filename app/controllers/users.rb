class Chitter < Sinatra::Base
  get '/signup' do
    erb :signup
  end

  post '/signup' do
    @user = User.create(email: params[:email],
                name: params[:name],
                username: params[:username],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/posts'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :signup
    end
  end
end
