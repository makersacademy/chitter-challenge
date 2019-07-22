require 'sinatra/base'
require 'capybara'
require_relative './lib/peeps.rb'

class Chitter < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    'Welcome to Chitter'
    erb :index
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps/new' do
    Peeps.create(peep: params['peep'], time: Time.now.strftime("%m/%d/%Y %H:%M"))
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :peeps
  end

  delete '/peeps/:id' do
    Peeps.delete(id: params[:id])
    redirect '/peeps'
  end

  run! if app_file == $0

end
