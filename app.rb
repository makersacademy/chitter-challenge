require 'pg'
require 'uri'
require 'sinatra/base'
require 'sinatra/flash'
require './lib/chitter'
require './lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do

    erb :'index'
  end

  post '/user_new' do
    User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps'
  end


  run! if app_file == $0

end
