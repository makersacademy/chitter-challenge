class CommentsController < ApplicationController

  def create
    @peep = Peep.find(params[:peep_id])
    @comment = @peep.comments.create!(params[:comment].permit(:body).merge(user: current_user))
    redirect_to peep_path(@peep)
  end
end
