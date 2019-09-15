# frozen_string_literal: true
require 'sinatra/base'
require './lib/peeps.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @peeps = Peeps.all
    erb :index
  end

  get '/add' do
    erb :adding_peeps
  end

  post 'new' do
    redirect '/'
  end

  run! if app_file == $0
end
