class Chitter < Sinatra::Base
  get '/' do
    redirect to '/posts'
  end

  get '/posts' do
    @peeps = Peep.all
    erb :'posts/index'
  end

  get '/posts/new' do
    erb :'posts/new'
  end

  post '/posts' do
    peep = Peep.create(message: params[:message], timestamp: Time.now, user_id: session[:user_id])
    if peep.save
      redirect to '/posts'
    else
      flash.now[:errors] = peep.errors.full_messages
    end
  end
end
