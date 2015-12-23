class Chitter < Sinatra::Base

  get '/' do
    erb :'temp'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.new(name: params[:name],
                    username: params[:username],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if user.save
      "User saved"
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'users/new'
    end
  end

end
