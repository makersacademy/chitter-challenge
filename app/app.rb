ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/peep'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end


#rake db:auto_upgrade RACK_ENV=test
