class PeepsController < ApplicationController

  def index
  end

  # holds the form for the new peep
  def new
  end

  # to save the peeps that are created
  def create
    @peep = Peep.new(peep_params)
    @peep.save

    redirect_to @peep
  end

  # to show an individual peep
  def show
    @peep = Peep.find(params[:id])
  end

  private

  def peep_params
    params.require(:peep).permit(:title, :body)
  end
end
