class Chitter < Sinatra::Base
  post '/comments' do
    comment = Comment.new(content: params[:content],
                          time: DateTime.now)
    peep = Peep.get(params[:id])
    if current_user
      current_user.comments << comment
      peep.comments << comment
      current_user.save
      can_save comment
    else
      flash.now[:errors] = ['You must be logged in to comment!']
      erb :'peeps/new'
    end
  end

  post '/comments/remove' do
    comment = Comment.get(params[:id])
    comment.destroy
    redirect '/'
  end
end
