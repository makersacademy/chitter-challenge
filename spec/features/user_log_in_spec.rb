require 'spec_helper'

RSpec.feature 'User log in' do

  scenario "- with correct credentials" do
    new_user_sign_up('foo@foo.com', '123secret', 'foo', 'Foo McFooface')
    user_log_in('foo@foo.com', '123secret')
    expect(page).to have_content("Welcome, Foo McFooface!")
  end

  scenario "- with incorrect credentials" do
    new_user_sign_up('foo@foo.com', '123secret', 'foo', 'Foo McFooface')
    user_log_in('foo@foo.com', 'silly wrong password')
    expect(page).to have_content("Email and/or password were incorrect")
  end

end
