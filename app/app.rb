ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/message'

class Chitter < Sinatra::Base

  get '/' do
    @messages = Message.all.reverse
    erb :index
  end

  post '/post_message' do
    message = Message.create(text: params[:message], username: params[:username], time: "#{Time.now.strftime "%R"}")
    redirect '/'
  end

  run! if app_file == $0

end
