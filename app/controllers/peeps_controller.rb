class PeepsController < ApplicationController

  def index
    @peeps = Peep.all.order('created_at DESC')
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

  # making sure both params are required when a new peep is submitted
  def peep_params
    params.require(:peep).permit(:title, :body)
  end
end
