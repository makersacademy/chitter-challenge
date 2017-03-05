class Chitter < Sinatra::Base

  get '/home' do
    @cheeps_by_time = Cheep.all(:order => [:created_at.desc])
    erb :home
  end

  get '/cheep/new' do
    erb :'/cheep/new'
  end

  post '/cheeps' do
    cheep = Cheep.create(content: params[:cheep], created_at: DateTime.now, user_id: session[:user_id])
    redirect '/home'
  end

end
