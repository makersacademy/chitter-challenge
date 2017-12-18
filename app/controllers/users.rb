class Chitter < Sinatra::Base

  helpers Helpers

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                name: params[:name],
                username: params[:username],
                password: params[:password],
                password_confirmation: params[:password_confirmation])

    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else flash.now[:error] = @user.errors.values.join("<br>")
      erb :'users/new'
    end
  end
end
