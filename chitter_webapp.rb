require 'data_mapper'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/peep'
require_relative './lib/user'
load './datamapper_setup.rb'


class ChitterApp < Sinatra::Base

  configure do
    use Rack::MethodOverride
    enable :sessions
    register Sinatra::Flash
  end

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    redirect '/sessions/new' unless session[:current_user]
    @peeps = Peep.all.sort_by { |peep| peep.created_at }.reverse
    erb :peeps
  end

  post '/peeps/new' do
    Peep.create(text: params[:peep])
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb :login
  end

  get '/users/new' do
    erb :register
  end

  post '/users/new' do
    user = User.create(user_name: params[:username],
                       display_name: params[:display_name],
                       email: params[:email],
                       password: params[:password]
                      )
    if user.saved?
      session[:current_user] = user.id
      redirect '/peeps'
    else
      flash[:notice] = user.errors.values.first
      redirect '/users/new'
    end
  end

  run! if __FILE__ == $0
end
