class Chitter < Sinatra::Base

  get '/user/new' do
    erb :'user/new'
  end

  post '/user/new' do
    user = User.create(name: params[:name],
                email: params[:email],
                callsign: params[:callsign],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
  end

end
