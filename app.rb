require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/peeps' do
    connection = PG.connect :dbname => 'chitter_test'
    result = connection.exec "SELECT * FROM peeps ORDER BY id desc;"
    @peeps = result.map do |row|
      Peep.new(id: row['id'], message: row['message'])
    end
    erb :'peeps/index'
  end

  post '/peeps' do
    @peep = Peep.create(message: params[:message])
    redirect "/peeps/#{@peep.id}"
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  get '/peeps/:id' do
    @peep = Peep.find(id: params['id'])
    erb :'peeps/show'
  end

  # establish server if file run directly
  run! if app_file == $0
end
