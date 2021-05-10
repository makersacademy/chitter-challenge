class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @peep  = current_user.peeps.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def contact
  end

  def about
  end
end
