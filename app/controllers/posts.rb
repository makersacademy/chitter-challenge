class Chitter < Sinatra::Base

  get '/posts/new' do
    erb :'posts/new'
  end

  post '/posts' do
    message = Cheep.create(message: params[:msg], created: Time.now)
    current_user.cheeps << message
    if message.save
      redirect '/posts/view'
    end
  end

  get '/posts/view' do
    @cheeps = Cheep.all
    erb :'posts/view'
  end
end