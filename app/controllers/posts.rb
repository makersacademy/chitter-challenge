class Chitter < Sinatra::Base

  get '/' do
    redirect('posts/all')
  end

  get '/posts/all' do
    @peeps = Peep.all
    erb(:'posts/all')
  end

  post '/posts/new' do
    peep = Peep.create(content: params[:new_peep], posted_at: Time.now, user_id: session[:user_id])
    p peep.user.username
    redirect('/posts/all')
  end

  get '/posts/new' do
    erb(:'posts/new')
  end

end
