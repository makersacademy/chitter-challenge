class CommentsController < ApplicationController

  def create
    @peep = Peep.find(params[:peep_id])
    peep_comments = @peep.comments
    new_comment = params[:comment].permit(:body)
    @comment = peep_comments.create!(new_comment.merge(user: current_user))
    redirect_to peep_path(@peep)
  end
end
