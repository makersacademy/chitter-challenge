require 'sinatra/base'
require_relative './lib/peep.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/all_peeps'
  end
  post '/peeps' do
    Peep.create(body: params[:body], time: Time.now)
    # peep = params[:body]
    # connection = PG.connect(dbname: 'chitter_test')
    # connection.exec("INSERT INTO peeps1 (url) VALUES('#{peep}');")
    redirect'/peeps'
    # session[:new_peep] = params[:body]
    # @peeps = Peep.all
    # @new_peep = Peep.create(body: session[:new_peep], time: Time.now)
    # erb :'peeps/view_peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

run! if app_file == $0
end
