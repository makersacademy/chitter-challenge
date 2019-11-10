require_relative 'database'
require 'sinatra/base'
require './lib/peep'


class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/peeps' do
    ENV
    @peeps = Peep.all
    erb(:peeps)
  end

  get '/peeps/new' do
    erb(:"peeps/new")
  end

  post '/peeps' do
    time = Time.now
    Peep.create(text: params["text"], :time => time)
    redirect '/peeps'
  end

  run! if app_file == $0
end
