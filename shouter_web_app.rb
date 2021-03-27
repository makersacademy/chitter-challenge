require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/shouter.rb'
Shouter.setup

class ShouterWebApp < Sinatra::Base
  enable :sessions, :method_override

  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader # this is from the Sinatra contrib gem
  end

  get '/' do
    @shouter = Shouter.all
    erb :index
  end

  post '/shout/new' do
    Shouter.shout(params[:shout_box])
    redirect '/'
  end

  run! if app_file == $0
end
