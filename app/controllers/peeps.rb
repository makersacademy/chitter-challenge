class Chitter < Sinatra::Base

get '/peeps' do
  erb :'peeps/home'
end
end
