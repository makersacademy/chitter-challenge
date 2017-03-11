require 'sinatra/base'
require 'database_cleaner'

require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  ENV["RACK_ENV"] ||= 'development'

  data_mapper_config

  get '/' do
    redirect('/log_in')
  end

  get '/log_in' do
    erb :log_in
  end

  get '/sign_up' do
    erb :sign_up
  end

  run! if app_file == $0

end
