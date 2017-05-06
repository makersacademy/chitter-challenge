class Chitter < Sinatra::Base

  post '/comments' do
    comment = Comment.first_or_create(comment: params[:comment], user: current_user, created_at: Time.now, post_id: params[:post_id])
    post = Post.get(params[:post_id])
    post.comments << comment
    post.save
    current_user.comments << comment
    current_user.save
    redirect to ('/posts')
  end
  
end
