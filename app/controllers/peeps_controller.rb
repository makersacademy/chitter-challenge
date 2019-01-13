class PeepsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @peeps = Peep.all.order('created_at DESC')
  end

  def new
    # ensures peeps are created from the current user
    @peep = current_user.peeps.build
  end

  # to save the peeps that are created
  def create
    @peep = current_user.peeps.build(peep_params)
    @peep.save

    redirect_to @peep
  end

  # to show an individual peep
  def show
    @peep = Peep.find(params[:id])
    @comment = Comment.new
  end

  private

  # making sure both params are required when a new peep is submitted
  def peep_params
    params.require(:peep).permit(:title, :body)
  end
end
