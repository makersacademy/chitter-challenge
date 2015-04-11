require 'sinatra/base'
require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'
DataMapper.setup(:default, "postgres://localhost/chitter_chatter_#{env}")
require './lib/user'
DataMapper.finalize
DataMapper.auto_upgrade!

class ChitterChatter < Sinatra::Base

  get '/' do
    erb :homepage
  end

  post '/' do
    @username = params[:username]
    @real_name = params[:real_name]
    @email = params[:email]
    @user = User.create(username: @username,
                        real_name: @real_name,
                        email: @email)
    erb :homepage
  end

  # start the server if ruby file executed directly
  run! if app_file == ChitterChatter

end
