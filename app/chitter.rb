require 'sinatra'
require 'sinatra/flash'

require_relative 'lib/peep'

class Chitter < Sinatra::Base
  configure do
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
    register Sinatra::Flash
  end

  get '/' do
    'Sign in page coming soon...'
  end

  get '/peeps' do
    erb :'/peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(content: params[:peep], user_id: session[:user_id])
    redirect '/peeps'
  end

  run! if app_file == $PROGRAM_NAME
end
