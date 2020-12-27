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
    Peep.create(params[:new_peep], 1)
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end
end