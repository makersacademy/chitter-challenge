require 'spec_helper'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
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
      fill_in(:username, with: "jsmith")
      fill_in(:email, with: "jsmith@hotmail.com")
      fill_in(:password, with: "password")
      click_button("Submit")
    end
    expect(User.last.name).to eq("John")
    within "div.top_bar" do
      expect(page).to have_content("Current user: John")
    end
  end
  scenario 'user can log in' do
    User.create(name: "John", username: "jsmith",
    email: "jsmith@hotmail.com", password: "password")
    visit('/')
    click_button('Log in')
    expect(page.status_code).to eq(200)
    within "div.login" do
      fill_in(:username, with: "jsmith")
      fill_in(:password, with: "password")
      click_button("Submit")
    end
    within "div.top_bar" do
      expect(page).to have_content("Current user: John")
    end
  end
end
