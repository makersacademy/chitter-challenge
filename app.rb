require 'sinatra/base'
require 'data_mapper'
require './lib/peep'
require './lib/user'
require 'date'

DataMapper.setup(:default, 'postgres://localhost/chitter')
DataMapper.finalize.auto_upgrade!

class Chitter < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/peeps' do
    @peeps = Peep.all(:order => [ :id.desc ], :limit => 20)
    erb(:all_peeps)
  end

  post '/peeps/new' do
    Peep.create(body: params[:body], username: '@tomas', created_at: Time.now)
    redirect '/peeps'
  end

  run! if app_file == $0
end
