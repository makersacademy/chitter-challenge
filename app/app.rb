ENV['RACK_ENV'] ||= 'development'

require 'data_mapper'
require 'dm-postgres-adapter'
require 'sinatra/base'
require 'sinatra/flash'
require 'erb'
require_relative 'models/peep'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/peeps/new' do
    erb :new_peep
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  post '/peeps' do
    peep = Peep.create(message: params[:message])
    peep.save
    redirect '/peeps'
  end

  run! if app_file == $0
end
