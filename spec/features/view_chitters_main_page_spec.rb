require 'spec_helper'
require 'web_helper'

feature 'view all the chitter peeps' do
  scenario 'a user can see all the posted peeps' do
    sign_up
    post_a_peep

    expect(page).to have_content "First peep text test"
  end
end
