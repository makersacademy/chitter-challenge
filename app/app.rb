ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'rake'
require 'securerandom'

# require_relative 'datamapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
  register Sinatra::Flash

  # start the server if ruby file executed directly
  run! if app_file == $0

  get '/' do
    erb :index
  end

  post '/user/new' do
  end

  get '/new/peeps' do
  end

  post '/peeps' do
  end

  get '/peeps' do
  end

end