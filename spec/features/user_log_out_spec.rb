require 'spec_helper'

RSpec.feature 'User log out' do

  scenario "- from peeps page" do
    new_user_sign_up('foo@foo.com', '123secret', 'foo', 'Foo McFooface')
    user_log_in('foo@foo.com', '123secret')
    click_button('Log out')
    expect(page).to have_content "Thanks for using chitter! Come back soon 🙂"
  end

end
