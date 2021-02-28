require 'sinatra/base'
require './lib/peep'
require 'pg'

class Chitter < Sinatra::Base
  enable :method_override
  
  get '/' do
    "Welcome to Chitter!"
  end

  get '/peeps' do
    @list = Peep.all
    erb :peeps
  end
      
  get '/peeps/new' do
    erb :'/peeps/new'
  end

  post '/peeps' do
    Peep.create(content: params['content'], created_at: Time.now.strftime("%Y-%m-%d %H:%M:%S"))
    redirect '/peeps'
  end

  run! if app_file == $0
end
