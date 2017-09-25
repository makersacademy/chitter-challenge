require 'sinatra/base'
require './app/model/peep'

class Chitter < Sinatra::Base

  get '/' do
    erb :home
  end

  post '/peeps' do
    peep = Peep.new(message: params[:message])
    peep.save
    redirect to('/peeps')
  end

  get '/peeps' do
    erb :peeps_list
  end

end

DataMapper.setup(:default, "postgres://localhost/chitter")
DataMapper.finalize
DataMapper.auto_upgrade!
