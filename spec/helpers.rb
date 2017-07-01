module Helpers
  def post_peep(message)
    visit '/peeps/new'
    fill_in :message, with: message
    click_button 'Submit'
  end
end
