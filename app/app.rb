require 'sinatra/base'
require_relative 'data_mapper_setup'
ENV['RACK_ENV'] ||= 'development'
class Chitter < Sinatra::Base

  get '/infrastructure' do
    'infrastructure working'
  end

  get '/peeps/new' do

  end

end
