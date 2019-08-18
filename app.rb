# require 'rubygems'
require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require 'sinatra/activerecord'
require 'active_record'
require_relative './db/models.rb'

# ActiveRecord::Base.establish_connection(
#   adapter:  "postgresql",
#   database: ENV['ENVIRONMENT'] == 'test' ? "chitter_test" : "chitter"
# )

class Chitter < Sinatra::Base
  register Sinatra::Reloader
  register Sinatra::Flash
  register Sinatra::ActiveRecordExtension

  enable :method_override
  enable :sessions

  set :public_folder, File.dirname(__FILE__) + '/static'

  get '/' do
    'Hello world.'
  end

  get '/users' do
    @users = User.all
    erb(:users)
  end

end
