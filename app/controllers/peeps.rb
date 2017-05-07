class Chitter < Sinatra::Base
  get '/peeps/all' do
    @peep = session[:peep]
    erb :'/peeps/all'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/submitted' do
    session[:peep] = params[:peep]
    redirect to('/peeps/all')
  end


end
