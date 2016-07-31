class Chitter < Sinatra::Base

  get '/peeps' do
  #@links = Link.all
    erb :'peeps/index'
  end

end
