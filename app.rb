require 'sinatra/base'
require './lib/message'

class MessageList < Sinatra::Base
  get '/' do
    "Welcome to Chitter!"
  end

  get '/peeps' do
    @peeps = Message.all
    erb :'index'
  end

  post "/peeps/post" do
    Message.create(:message => params[:write])
    redirect("/peeps")
  end

  run! if app_file == $0
end
