require 'sinatra'
require 'sinatra/activerecord'

set :database_file, 'config/database.yml'

Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file }

class Chitter < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/' do
    'Hello world!'
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.order(created_at: :desc)
    erb :index
  end

  post '/peeps/new' do
    @peep = Peep.create(content: params[:content])
    redirect '/peeps'
  end

  run! if app_file == $0

end