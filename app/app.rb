ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative './models/peep'
require_relative './models/maker'

class Chitter < Sinatra::Base

  get '/peeps' do
    @maker = Maker.first
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps/new_peep' do
    Peep.create(text: params[:peep], time: Time.now.asctime)
    redirect '/peeps'
  end

  get '/makers/sign_up' do
    erb :'makers/sign_up'
  end

  post '/makers/new_maker' do
    Maker.create(username: params[:username], email: params[:email], password: params[:password])
    redirect '/peeps'
  end

end
