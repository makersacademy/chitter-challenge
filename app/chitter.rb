require 'sinatra'
require 'data_mapper'
require 'byebug'

require_relative 'models/user'
require_relative 'models/peep'


env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_users_#{env}")

require_relative 'models/user'

DataMapper.finalize

DataMapper.auto_upgrade!

get '/' do
  @peeps = Peep.all
  erb :index
end



post '/peeps' do
  input = params[:text]
  Peep.create(text: input)
  redirect to('/')
end