require 'sinatra/base'
require './lib/peeps.rb'
require 'date'
class Peep < Sinatra::Base

get '/' do
  @peeps = Message.all
  erb :index
end

get '/new' do
  erb :new
end

post '/peeps' do
  message = params[:message]
  # date = DateTime.now
  # date.strftime("%d/%m/%Y %H:%M")
  connection = PG.connect(dbname: 'peep_manager_test')
  connection.exec("INSERT INTO peeps (peep) VALUES('#{message}')")
  # Peeps.create(peep: params[:peep], date: DateTime.now)
  redirect('/')
end


  run! if app_file == $0
end
