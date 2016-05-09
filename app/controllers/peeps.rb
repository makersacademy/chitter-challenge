class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :'/peeps/latest'
  end

  get '/peeps/new' do
    redirect '/users/new' unless current_user
    erb :'peeps/new'
  end

  post '/peeps/new' do
    current_user.peeps << new_peep
    current_user.save
    redirect '/'
  end
    
end
