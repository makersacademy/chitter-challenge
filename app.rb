require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    'Welcome to Chitter'
  end

  get '/peeps' do
    @peep = session[:peep]
    erb :"peeps/index"
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    @peep = params[:"What's happening?"]
    session[:peep] = @peep
    redirect '/peeps'
  end

  run! if app_file == $0
end
