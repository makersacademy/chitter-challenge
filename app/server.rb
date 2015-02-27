require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'

class Chitter < Sinatra::Base

  env = ENV['RACK_ENV'] || 'development'

  set :views, Proc.new {File.join(root, "..", "views")}

  DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

  require_relative './lib/cheet'
  require_relative './lib/user'

  DataMapper.finalize
  DataMapper.auto_upgrade!


  get '/' do
    @cheets = Cheet.all
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
