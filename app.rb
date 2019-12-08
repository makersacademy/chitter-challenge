require 'pg'
require 'sinatra/base'

class ChitterChatter < Sinatra::Base

  enable :session

  get "/" do
    erb :index
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peep_post' do
    session[:peep] = params["message"]
    redirect '/peeps'
  end

  get '/peeps' do
    @peep = session[:peep]
    erb :'chitter'
  end


  run! if app_file == $0

end
