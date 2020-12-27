require 'sinatra/base'
require_relative './lib/peep.rb'

class Chitter < Sinatra::Base

  get '/' do
    "Hello world!"
  end

  get '/post_peep' do
    erb :post_peep
  end

  post '/new_peep' do
    @new_peep = params[:new_peep]
    redirect '/peeps'
  end
end