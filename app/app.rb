ENV['RACK_ENV'] ||= 'development'

require_relative 'app_helpers'
require_relative 'data_mapper_setup'
require 'sinatra/base'
require 'time'

class Chitter < Sinatra::Base
  enable :sessions
  enable :secret_sessions, 'secret'

  get '/' do
    redirect '/home'
  end

  get '/home' do
    @peeps = Peep.all
    # p 'HERE!!'
    # p @peeps
    # p 'END'
    erb :'home/index'
  end

  post '/peep/new' do
    peep = Peep.create(message: params[:new_peep_box], datetime: Time.now.utc)
    peep.save
    redirect '/home'
  end
end
