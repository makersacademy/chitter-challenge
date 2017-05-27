class Chitter < Sinatra::Base

  post '/comments' do
    comment = Comment.create(comment: params[:comment],
    user: current_user, created_at: Time.now, post_id: params[:post_id])
    post = Post.get(params[:post_id])
    post.comments << comment
    post.save
    redirect to '/posts'
  end

end
