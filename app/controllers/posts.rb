class Fitter < Sinatra::Base
  get '/posts/new' do
    erb :'posts/new'
  end

  post '/posts' do
    post = Post.create(tip: params[:tip], user_id: current_user.id, user_name: current_user.user_name)
    current_user.posts << post
    post.save
    current_user.save
    redirect '/posts'
  end

  get '/posts' do
    @posts = Post.all
    @user = current_user
    erb :'posts/index', :layout => :'posts/layout'
  end
end
