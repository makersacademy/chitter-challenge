module Helpers
  def post_peep(message = "Hello")
    visit '/peeps/new'
    fill_in 'message', with: message
    click_button 'Peep!'
  end
end
