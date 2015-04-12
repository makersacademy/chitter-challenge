class Chittter < Sinatra::Base

  get '/peeps/new' do
    erb :'peeps/new'
  end

end
