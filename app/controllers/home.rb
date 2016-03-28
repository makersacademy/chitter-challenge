class Chitter < Sinatra::Base

  get '/' do
    if current_user
      redirect to '/home'
    else
      redirect to '/users/new'
    end
  end

  get '/home' do
    erb(:home)
  end
end
