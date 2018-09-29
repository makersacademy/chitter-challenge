require 'sinatra'
require 'sinatra/base'
require './lib/peep'


class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/post' do
    Peep.create peep: params[:peep], created_at: Time.now, user_id: 1
    redirect '/'
  end

end
