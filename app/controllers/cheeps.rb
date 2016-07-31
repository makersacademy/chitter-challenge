class Chitter < Sinatra::Base

  get '/' do
    redirect to '/cheeps'
  end

  get '/cheeps' do
    @cheeps = Cheep.all.reverse
    erb :'cheeps/index'
  end

  post '/cheeps' do
    cheep = Cheep.create(content: params[:content],
                         user_id: session[:user_id],
                         time: Time.now)
    cheep.save
    redirect to '/cheeps'
  end

  get '/cheeps/new' do
    erb :'cheeps/new'
  end



end
