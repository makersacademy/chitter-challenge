# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/feature_test_env' do
    erb :feature_test_env
  end

  get '/peeps/post' do
    erb :'peeps/post'
  end

  post '/peeps' do
    Peep.create(message: params['message'])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :"peeps/index"
  end
end
