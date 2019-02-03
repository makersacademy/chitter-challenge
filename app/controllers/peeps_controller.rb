class PeepsController < ApplicationController

  def index
    @peeps = Peep.all
  end

  def show
    @peep = Peep.find(params[:id])
  end

  def new
  end

  def create
    # render plain: params[:peep].inspect
    @peep = Peep.new(peep_params)

    @peep.save
    redirect_to @peep
  end

  private

  def peep_params
    params.require(:peep).permit(:msg)
  end
end
