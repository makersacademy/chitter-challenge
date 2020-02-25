require 'sinatra'
require 'sinatra/base'
require 'sinatra/activerecord'
require './models/users.rb'
require './models/peeps.rb'

class Chitter < Sinatra::Base
    
    get '/' do
        erb :index
    end

    get '/peeps/new' do
        erb :'peeps/new'
    end

    post '/peeps' do
        Peep.create(content: params[:content])
        redirect('/peeps')
    end

    get '/peeps' do
        @peeps = Peep.all
        erb :peeps
    end

end