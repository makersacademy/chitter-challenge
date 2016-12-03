require 'spec_helper'

RSpec.feature 'User log in' do

  scenario "- with correct credentials" do
    new_user_sign_up('foo@foo.com', '123secret', 'foo', 'Foo McFooface')
    visit '/sessions/new'
    fill_in :email, with: 'foo@foo.com'
    fill_in :password, with: '123secret'
    click_button("Submit")
    expect(page).to have_content("Welcome, Foo McFooface!")
  end

end
