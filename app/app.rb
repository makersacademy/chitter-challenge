
ENV['RACK-ENV'] ||= 'development'

require_relative 'data_setup'
require 'sinatra/base'
require 'pry'

class Chitter < Sinatra::Base

  enable :sessions


  get '/' do
    erb :post_peep
  end

  post '/peep' do
    Peep.create(message: params[:message])
    redirect '/posts'
  end

  get '/posts' do
    @peeps = Peep.all(:order => [ :created_at.desc ])
    erb :posts
  end

run! if app_file == $0

end
