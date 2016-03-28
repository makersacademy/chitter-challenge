class Chitter < Sinatra::Base

  post '/chitters/new' do
    current_user = User.get(session[:user_id])
    current_user.posts.create(message: params[:message],
                              timestamp: Time.now.strftime("%I:%M%p %m/%d/%Y"))
    redirect to '/home'
  end

  delete '/chitters/delete' do
    post = Post.get(params[:delete_id])
    post.comments.destroy
    post.destroy
    redirect to '/home'
  end
end
