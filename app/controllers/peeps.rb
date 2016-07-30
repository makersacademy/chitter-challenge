class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peeps.all
    erb :'peeps/index'
  end

  get 'peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.create(title: params[:title], message: params[:message])
  end
end
