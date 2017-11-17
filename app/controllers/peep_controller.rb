class Chitter < Sinatra::Base
  get '/new_peep' do
    erb :'peeps/new'
  end

  post '/add_peep' do
    session[:peep] = Peep.create(content: params[:content]).content
    redirect '/'
  end
end
