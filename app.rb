require 'sinatra/base'
require 'sinatra/activerecord'
require './config/environment'

# Global for verbose output
# $verbose = true

class Peep < ActiveRecord::Base 

end

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }

  before '/' do
    verbose_output(request) if $verbose
  end

  get '/' do
    erb :"peeps/new"
  end

  post '/' do
    peep = Peep.new(params["peep"])
    if peep.save
      redirect "peeps/#{peep.id}"
    else
      erb :"peeps/new"
    end
  end

  get '/peeps/:id' do
    @peep = Peep.find(params[:id])
    erb :"peeps/show"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

  private

  # :nocov:
  def verbose_output(request)
    puts "\n#{request.request_method}: #{request.path}"
    puts "session: "; p session
    puts "params: "; p params
  end
  # :nocov:

end
