require 'sinatra/flash'

class PeepsController < Sinatra::Base
set :views, './views'
register Sinatra::Flash

get '/peeps' do
  @maker = Maker.find(id: session[:maker_id])
  erb :'peeps/index'
end
get '/peeps/new' do
  erb :'peeps/new'
end

post '/peeps/new' do
  Peep.create(message_content: params[:message_content], maker_id: session[:maker_id])
  redirect '/peeps/list'
end

get '/peeps/list' do
  @peeps = Peep.all
  @makers = Maker.all
  erb :'peeps/list'
end


end
