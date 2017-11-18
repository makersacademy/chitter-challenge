class Chitter < Sinatra::Base
  get '/new_peep' do
    erb :'peeps/new'
  end

  post '/add_peep' do
    create_peep(params[:content])
    load_peeps
    redirect "/user/#{session[:username]}"
  end
end
