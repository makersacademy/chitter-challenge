require 'sinatra/base'
require_relative './lib/peep.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/peeps' do
    peeps = ["First test peep", "Second test peep", "Third test peep"]
  end

  post '/peeps' do
    session[:new_peep] = params[:body]
    @new_peep = Peep.create(body: session[:new_peep])
    erb :'peeps/view_peeps'
  end

  get '/peeps/new' do
    erb :'peeps/create_peeps'
  end

run! if app_file == $0
end
