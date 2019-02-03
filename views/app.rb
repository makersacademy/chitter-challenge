require 'sinatra'



get '/' do
  "Hello World"
end

get '/secret' do
  "This is a secret page"
end

get '/me' do
  "Hello me"
end

get '/random-cat' do
  @name = ["Amigo", "Oscar", " Viking"].sample
  erb(:index)
end

get '/cat-form' do
  erb(:form)
end

post '/named-cat' do
  p params
  @name = params[:name]
  erb(:index)
end
