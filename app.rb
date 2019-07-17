require 'sinatra/base'
require 'capybara'
require_relative './lib/peeps.rb'

class Chitter < Sinatra::Base

  get '/' do
    'Welcome to Chitter'
    erb :index
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :peeps
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peeps.create(peep: params['peep'])
    redirect '/peeps'
  end

  run! if app_file == $0

end
