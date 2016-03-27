class Chitter < Sinatra::Base
  get "/:peep_id/comments/new" do
    @peep_id = params[:peep_id]
    erb :"comments/new" if current_user
  end

  post "/comments" do
    Comment.create(content: params[:content], user_id: current_user.id, peep_id: params[:peep_id])
    redirect "/#{params[:peep_id]}/comments"
  end

  get "/:peep_id/comments" do
    @peep = Peep.get(params[:peep_id])
    @comments = @peep.comments.reverse
    erb :"comments/index"
  end

end
