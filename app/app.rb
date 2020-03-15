require "sinatra/activerecord"
require './spec/setup_database_test'
require './lib/message'
require './lib/user'

class ChitterManager < Sinatra::Base

  register Sinatra::ActiveRecordExtension

  configure :development do
    set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'chitter'}
  end

  configure :test do
    set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'chitter_test'}
  end

  get '/' do
    @messages = Message.order(time_created: :desc)
    erb :index
  end

  get '/new' do
    erb :new
  end

  post '/new' do
    Message.create(content: params[:content], time_created: Time.now)
    redirect('/')
  end

  run! if app_file == $0
end
