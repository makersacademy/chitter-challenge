require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :session

  get '/' do
    'Welcome! Please, enjoy our Chitter app!'
  end

  get '/peeps' do
    @peep = session[:peep]
    erb :"peeps/index"
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    @peep = params[:text]
    session[:peep] = @peep
    redirect '/peeps'
  end

  run! if app_file == $0
end
