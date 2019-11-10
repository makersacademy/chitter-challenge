require_relative 'database'
require 'sinatra/base'
require './lib/peep.rb'


class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @peeps = []
    erb(:index)
  end

  get '/peeps' do
    @peeps = Peep.all.map { |peep| @peeps << { id: peep.id, text: peep.text, created_at: peep.created_at } }
    erb(:"peeps/peeps")
  end

  get '/peeps/new' do
    erb(:"peeps/new")
  end

  post '/peeps' do
    peep = Peep.new(text: params["text"])
    @peeps << peep
    redirect '/peeps'
  end

  run! if app_file == $0
end
