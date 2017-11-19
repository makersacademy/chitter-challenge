ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'app_helpers'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  enable :secret_sessions, 'secret'

  get '/' do
    redirect '/home'
  end

  get '/home' do
    @peeps = Peep.all
    erb :'home/index'
  end

  post '/peep/new' do
    peep = Peep.create(message: params[:new_peep_box])
    peep.save
    redirect '/home'
  end
end

# p 'HERE!!'
# p @peeps.length
# p 'END'
