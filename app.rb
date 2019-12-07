require 'sinatra/base'
# require './lib/peep'
# require './database_connection_setup'
require 'sinatra/flash'

class ChitterApp < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  post '/peeps' do
    session[:username] = params[:username]
    redirect '/peeps'
  end

  get '/peeps' do
    @username = session[:username]
    erb :'peeps/index'
  end


  run! if app_file == $0
end