require 'sinatra'
require 'sinatra/reloader'
require './lib/peep'
require './database_connection_setup'


class Chitter < Sinatra::Base

  configure :development do 
    register Sinatra::Reloader
  end

  get '/' do 
    @peeps = Peep.all
    erb :index
  end

  post '/peep' do
    Peep.create(text: params[:text], user_name: params[:user_name], handle: params[:handle], time_posted: Time.new)
    redirect '/'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/confirm_sign_up' do
    erb :confirm_sign_up
  end
end
