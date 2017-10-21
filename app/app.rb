require 'sinatra/base'
require './app/models/peep'

class Chitter < Sinatra::Base

  get '/peeps' do
  @peeps = Peep.all
  erb :'peeps/index'
  end

  get'/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(name: params[:name], username: params[:username],
    message: params[:message], time: Time.new.strftime("%I:%M%p"))
    redirect '/peeps'
  end

end
