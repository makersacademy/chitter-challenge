require 'sinatra'
require 'sinatra/flash'

class TwitTwoo < Sinatra::Base
  register Sinatra::Flash

  enable sessions

  get '/' do
    erb :index
  end

  post '/register' do
    @owl = Owl.save(nam: params[:name], username: params[:username], password: params[:password], email: params[:email])
    if @owl.id
      session[owl_id] = @owl.id
      redirect '/nest'
    else
      flash.now[:error] = @owl.errors.full_messages
      erb :register
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end