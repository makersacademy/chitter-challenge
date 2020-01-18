require 'sinatra/base'

class ChitterApp < Sinatra::Base
  enable :sessions
  
  get '/' do
    erb :index
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    session[:peep] = params[:text]
    redirect '/peeps'
  end

  get '/peeps' do
    @peep = session[:peep]
  end

end