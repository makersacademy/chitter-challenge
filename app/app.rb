ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require './app/data_mapper_setup'



class Chitter < Sinatra::Base
  enable :sessions

  get '/infrastructure' do
    'infrastructure working'
  end

  get '/peeps/new' do
    erb :new_peep
  end

  post '/feed' do
    Peep.create(contents: params[:peep])
    redirect '/feed'
  end

  get '/feed' do
    @peeps = Peep.all.reverse
    erb :feed
  end
end
