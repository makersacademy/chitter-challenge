ENV['RACK_ENV'] ||= 'development'

require 'pry'
require 'sinatra/base'
require './config/data_mapper'

class Chitter < Sinatra::Base
  enable :sessions
  enable :method_override

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/peep' do
    @peep = Peep.create(
      text: params[:peep], posted_at: Time.now
    )
    redirect '/'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    redirect '/profile'
  end

  get 'profile' do
    erb :profile
  end

end
