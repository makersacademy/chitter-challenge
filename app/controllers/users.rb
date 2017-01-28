class Chitter < Sinatra::Base
  get '/signup' do
    slim :'users/new'
  end

  post '/addnewuser' do
    @user = User.create(email: params[:email],
                        name: params[:name],
                        username: params[:username],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    end
  end
end
