require 'sinatra/base'
require_relative './lib/peep.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
  end

  post '/peeps' do
    session[:new_peep] = params[:body]
    @peeps = Peep.all
    @new_peep = Peep.create(body: session[:new_peep], time: Time.now)
    erb :'peeps/view_peeps'
  end

  get '/peeps/new' do
    erb :'peeps/create_peeps'
  end

run! if app_file == $0
end
