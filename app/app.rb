
ENV['RACK-ENV'] ||= 'development'

require_relative 'data_setup'
require_relative 'helpers'
require 'sinatra/base'
require 'pry'

class Chitter < Sinatra::Base

  helpers Helpers

  enable :sessions

  get '/' do
    erb :sign_up
  end

  post '/sign_up' do
    user = User.create(name: params[:name], username: [:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    if user.id == nil
      redirect '/'
    else
      redirect '/post_peep'
    end
  end

  get '/post_peep' do
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
