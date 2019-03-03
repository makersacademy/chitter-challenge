require 'sinatra/base'
require_relative './lib/peep.rb'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end
  post '/peeps' do
    Peep.create(peep: params[:peep], time: Time.now)
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

  delete '/peeps/:id' do
    Peep.delete(id: params[:id])
    redirect '/peeps'
  end

  get '/peeps/:id/edit' do
    @peep = Peep.find(id: params[:id])
    # @peep_id = params[:id]
    erb :'peeps/edit'
  end

  patch '/peeps/:id' do
    Peep.update(id: params[:id], peep: params[:peep], time: params[:time])
    # p params
    # connection = PG.connect(dbname: 'chitter_test')
    # connection.exec("UPDATE peeps1 SET peep = '#{params[:peep]}', time: #{Time.now} WHERE id = '#{params[:id]}';")
    redirect '/peeps'
  end

run! if app_file == $0
end
