class Chitter < Sinatra::Base

  post '/comments' do
    comment = Comment.create(user: current_user,
                            comment_text: params[:comment_text],
                            created_at: Time.now,
                            post_id: params[:post_id])
    redirect to '/posts'
  end

end
