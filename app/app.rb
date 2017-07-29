ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

# require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/peeps' do
    @peeps = Peep.all
    p @peeps
    erb :'index'
  end

  get '/peeps/new' do
    erb :'new'
  end

  post '/peeps' do
    peep = Peep.new(message: params[:message])
    peep.save
    p peep
    redirect '/peeps'
  end

run! if app_file == $0
end
