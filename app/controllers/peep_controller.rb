class Chitter < Sinatra::Base
  get '/new_peep' do
    erb :'peeps/new'
  end

  post '/add_peep' do
    Peep.create(content: params[:content])
    redirect '/'
  end
end
