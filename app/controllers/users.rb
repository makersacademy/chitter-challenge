class Chitter < Sinatra::Base
  
  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    if create_user(params)
      redirect to('/peeps')
    else
      flash.now[:notice] = "Invalid login"
      erb :'users/new'
    end
  end

  get '/users/profile' do
    erb :'users/profile'
  end

end
