require 'sinatra/base'
require_relative './lib/chitter_model'
require 'sass'

class Chitter < Sinatra::Base

  get '/styles.css' do
    scss :styles
  end

  get '/' do
    erb :front_page
  end

  get '/chitter' do
    erb :'chitter/index'
  end

  get '/chitter/new' do

    erb :'chitter/new', :layout => :layout
  end

  get '/chitter/username' do
    @peeps = ChitterModel.all
    erb :'chitter/username'
  end

  post '/chitter/username' do
    ChitterModel.create(params[:peep])
    redirect '/chitter/username'
  end

  run! if __FILE__ == $0
end