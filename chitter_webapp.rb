require 'data_mapper'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/peep'
load './datamapper_setup.rb'


class ChitterApp < Sinatra::Base

  configure do
    enable :sessions
  end

  get '/' do
    "Welcome to Chitter"
  end

  get '/peeps' do
    @peeps = Peep.all.sort_by { |peep| peep.created_at }.reverse
    erb :peeps
  end

  post '/peeps/new' do
    peep = Peep.new(text: params[:peep])
    peep.save
    redirect '/peeps'
  end

  run! if __FILE__ == $0
end
