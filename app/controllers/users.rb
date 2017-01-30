class Chitter < Sinatra::Base

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    user = User.create(name: params[:name],
                    email: params[:email],
                    username: params[:username],
                    password: params[:password])
    redirect '/timeline'
    end
end
