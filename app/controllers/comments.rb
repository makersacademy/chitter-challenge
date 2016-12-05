class Chitter < Sinatra::Base

  post '/comments' do
    comment = current_user.comments.new(comment: params[:comment], peep_id: params[:peep_id])
    if comment.save
      flash.now[:notice] = ["Comment was created created"]
      redirect to("/comments/#{comment.id}")
    else
      flash.now[:notice] = ["Comment could not be created"]
      redirect back
    end
  end

  get '/comments/:id' do
    @comment = Comment.get(params[:id])
    erb(:comment)
  end


end
