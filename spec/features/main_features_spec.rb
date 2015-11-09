require 'spec_helper'
feature Chitter do
  scenario 'it loads a home page' do
    visit('/')
    expect(page.status_code).to be(200)
    within 'div.welcome' do
      expect(page).to have_content("Welcome to Chitter")
    end
  end
  scenario 'user can sign up' do
    visit('/')
    click_button('Sign up')
    within "div.sign_up_form" do
      fill_in(:name, with: "John")
      fill_in(:username, with: "smith")
      fill_in(:email, with: "jsmith@hotmail.com")
      fill_in(:password, with: "password")
      click_button("Submit")
    end
    expect(User.last.name).to eq("John")
    within "div.top_bar" do
      expect(page).to have_content("Current user: John")
    end
  end
end
