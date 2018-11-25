require 'sinatra/base'
require 'capybara'
require 'pg'
require './database_connection_setup'
require_relative './lib/peeps.rb'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/peeps' do
    @peeps = Peeps.all
    erb :index
  end

  get '/post_peep' do
    erb :post_peep
  end

  post '/peeps' do
    @peep = Peeps.post(params[:context])
    redirect '/peeps'
  end

  run! if app_file == $0

end
 
