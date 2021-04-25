class PeepsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @peep = current_user.peeps.build(peep_params)
    if @peep.save
      flash[:success] = "Peep created!"
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'static_pages/home'
    end
  end

  def destroy
    @peep.destroy
    flash[:success] = "Peep deleted"
    if request.referrer.nil? || request.referrer == peeps_url
      redirect_to root_url
    else
      redirect_to request.referrer
    end
  end

  private

  def peep_params
    params.require(:peep).permit(:content)
  end

  def correct_user
    @peep = current_user.peeps.find_by(id: params[:id])
    redirect_to root_url if @peep.nil?
  end
end
