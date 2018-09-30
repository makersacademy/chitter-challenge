require 'sinatra/base'
require 'pg'
require './lib/message'

require 'data_mapper'

class Chitter < Sinatra::Base

  get '/' do
    DataMapper.setup(:default, 'postgres://localhost:5432/chitter')
    DataMapper.finalize
    erb :homepage
  end

  post '/message' do
    Message.create(
      :body       => params['message'],
      :userid     => 1,
      :time => Time.now
    )
    redirect '/messageboard'
  end

  get '/messageboard' do
    @messageboard = Message.all(:order => [ :time.desc ])
    erb :messageboard
  end

  run! if app_file == $0
end
