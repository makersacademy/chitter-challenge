require 'data_mapper'
require 'sinatra'
require_relative 'user'
require_relative 'peep'

env = ENV['RACK_ENV'] || 'development'

# DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "postgres://localhost/chitter_challenge_#{env}")

require './lib/user'
DataMapper.finalize
# DataMapper.auto_migrate!
DataMapper.auto_upgrade!

get '/' do
  @peeps = Peep.all
  erb :index
end

post '/peeps' do
  message = params["message"]
  Peep.create(:message => message)
  redirect to('/')
end





