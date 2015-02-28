require 'sinatra'
require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './app/models/peep'
require './app/models/maker'

DataMapper.finalize

DataMapper.auto_upgrade!

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/peeps' do
    message = params[:message]
    name = params[:name]
    username = params[:username]
    Peep.create(:message => message, :name => name, :username => username)
    redirect to ('/')
  end
