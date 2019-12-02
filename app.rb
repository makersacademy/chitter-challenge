# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/feature_test_env' do
    erb :feature_test_env
  end
end
