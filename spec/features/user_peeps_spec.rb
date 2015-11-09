require 'spec_helper'

feature "So that I can let people know what I am doing" do
  scenario "I want to post a peep" do
    visit '/'
    click_link('signup')
    user_sign_up
    click_link('signout')
    click_link('signin')
    expect(page).to have_content("Please Sign In")
    user_sign_in
    expect(page).to have_content("Hi, David Jones!")
    user_post_peep
    expect(page).to have_content("This is a peep from me")
  end

  scenario "I want to see date/time on peeps" do
    visit '/'
    click_link('signup')
    user_sign_up
    click_link('signout')
    click_link('signin')
    expect(page).to have_content("Please Sign In")
    user_sign_in
    expect(page).to have_content("Hi, David Jones!")
    user_post_peep
    expect(page).to have_content(Time.now.strftime('%d-%m-%Y %H:%M'))
  end
end
