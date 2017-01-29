class Chitter < Sinatra::Base
  get '/' do
    redirect '/feed'
  end

  get '/feed' do
    @peeps = Peep.all(order: [:created_at.desc])
    erb :'feed/index'
  end

  post '/feed' do
    user = current_user
    Peep.create(body: params[:body], created_at: params[:created_at], user_id: session[:user_id])
    redirect to '/feed'
  end
end
