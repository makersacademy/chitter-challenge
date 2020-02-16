require 'sinatra/base'
require './lib/chitter.rb'
require './lib/log_in.rb'

class ChitterManager < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/' do
    @result = LogIn.check_password(params[:user_name], params[:password])
    erb :log_in_result
  end

  get '/make_a_peep' do
    erb :make_a_peep
  end

  post '/make_a_peep' do
    Chitter.new_peep(params[:user_name], params[:peep])
    redirect ('/view_peeps')
  end

  get '/view_peeps' do
    @allpeeps = Chitter.all
    erb :view_peeps
  end

end
