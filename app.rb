require 'sinatra/base'
require 'peep'

class Chitter < Sinatra::Base
  enable :session

  get '/' do
    'Welcome! Please, enjoy our Chitter app!'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :"peeps/index"
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    @peeps = params[:text]
    session[:peep] = @peeps
    redirect '/peeps'
  end

  run! if app_file == $0
end
