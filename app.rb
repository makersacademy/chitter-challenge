require 'sinatra/base'
require './lib/chitter'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    @peep_message = session[:peep]

    erb :index
  end

  post '/peeps' do
    session[:peep] = params[:peep_message]

    redirect '/'
  end
  run! if app_file == $0
end