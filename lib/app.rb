require 'sinatra/base'
require_relative 'peeps'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/' do
    @username = params[:username]
    @email = params[:email]
    @password = params[:password]
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :peeps
  end

  post '/peeps' do
    Peeps.post(params[:peep])
    redirect '/peeps'
  end

  run! if app_file == $0

end
