require 'sinatra/base'
require_relative 'models/peep'

class Chitter < Sinatra::Base

  get '/' do
    'Hello world'
  end

  get '/peeps' do
    erb :peeps_list
  end

  get '/peeps/new' do
    erb :'new_peep'
  end

  post '/peeps' do
    Peep.create(message: params[:message])
    redirect '/peeps'
  end

end
