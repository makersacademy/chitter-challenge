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
  Message.create(message: params[:message], title: params[:title], date: Time.now.strftime("%d/%m/%Y %H:%M"))
  redirect('/')
end


  run! if app_file == $0
end
