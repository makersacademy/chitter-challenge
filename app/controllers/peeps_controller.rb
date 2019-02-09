class PeepsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @peeps = Peep.all.order('created_at DESC')
  end

  def new
    @peep = current_user.peeps.build
  end

  def create
    @peep = current_user.peeps.build(peep_params)
    @peep.save

    redirect_to @peep
  end

  def show
    @peep = Peep.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    @pic.detroy
    redirect_to 'root_path'
end

  private

  def peep_params
    params.require(:peep).permit(:title, :body)
  end
end
