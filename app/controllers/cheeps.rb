class Chitter < Sinatra::Base

  get '/cheeps' do
    @cheeps = Cheep.all
    erb :'cheeps/home'
  end

  post '/cheeps' do
    user = current_user
    @cheep = user.cheeps.create(body: params[:body],
      created_at: Time.now, posted_by: user.name,
      handle: user.user_name)
    redirect '/cheeps'
  end

  get '/cheeps/new' do
    erb :'cheeps/new'
  end

end
