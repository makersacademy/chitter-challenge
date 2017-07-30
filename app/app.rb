require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative './models/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get '/feed' do
    @peeps = Peep.all
    erb :feed
  end

  post '/feed' do
    Peep.create(message: params[:message], time_created: Time.now)
    redirect '/feed'
  end
end
