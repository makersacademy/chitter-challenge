class ChitterApp < Sinatra::Base

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    User.create(name: params[:name],
                email: params[:email],
                user_name: params[:user_name],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
                
  end
end
