require 'sinatra/base'
require_relative './lib/peep'
require 'pg'
require 'data_mapper'

class Chitter < Sinatra::Base

  if ENV['RACK_ENV'] == 'test'
    DataMapper.setup(:default, 'postgres://student@127.0.0.1:5432/chitter_test')
  else
    DataMapper.setup(:default, 'postgres://postgres@127.0.0.1:5432/chitter_prod')
  end

  get '/' do
    @peeps = Peep.all(:order => [ :peep_time.desc ])
    erb :index
  end

  post '/peep' do
    Peep.create(:name=>params[:user_name],:handle=>params[:handle],:peep_text=>params[:peep_text],:peep_time=>Time.now.strftime("%R").to_s)
    #Peep.create_peep(params[:user_name],params[:handle],params[:peep_text])
    redirect '/'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end