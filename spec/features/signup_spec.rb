require 'spec_helper'

feature "displays the homepage" do
  scenario "should return status 200" do
    visit("/signup")
    expect(page.status_code).to eq(200)
  end

  scenario 'A user can sign up' do
    visit("/signup")
    fill_in('name', with: 'Joanne')
    fill_in('email', with: 'test')
    fill_in('password', with: 'password')
    click_button('Submit')

    expect(page).to have_content 'Thanks for signing up!'
  end
end