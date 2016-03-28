class Chitter < Sinatra::Base

  post '/comments/new' do
    comment = Comment.create(comment: params[:comment],
                             timestamp: Time.now.strftime("%I:%M%p %m/%d/%Y"))
    current_user = User.get(session[:user_id])
    post = Post.get(params[:id])
    current_user.comments << comment
    current_user.save
    post.comments << comment
    post.save
    redirect to '/home'
  end

  delete '/comments/delete' do
    Comment.get(params[:delete_id]).destroy
    redirect to '/home'
  end
end
