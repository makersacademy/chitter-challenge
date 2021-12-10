require 'sinatra'
require 'sinatra/reloader'
require './lib/peep'


class Chitter < Sinatra::Base

  configure :development do 
    register Sinatra::Reloader
  end

  get '/' do 
    erb :index
  end

  post '/peep' do
    @peep = Peep.new(text: params[:text], user_name: params[:user_name], handle: params[:handle])
    redirect '/'
  end
end
