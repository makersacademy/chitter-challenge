require 'spec_helper'

# As a maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature "Peeps Time of Creation" do
  include Helpers
  scenario "I want to see when a peep was made" do
    time = Time.now
    sign_up
    log_in
    peep
    expect(page).to have_content time.strftime("%I:%M %p")
  end
end
