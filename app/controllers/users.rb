class Chitter < Sinatra::Base

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation],
                     name: params[:name],
                     user_name: params[:user_name])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps', 303
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end
end
