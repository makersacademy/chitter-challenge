require 'spec_helper'

feature "Post messages" do

  scenario "users can view messages" do
    User.create(name: "Alistair", email: "al@here.com", user_name: "Al", password: "2222", password_confirmation: "2222", messages: [Message.create(title: "Hello World", content:"Just wanna say hi")])
    visit '/messages'
    expect(page.status_code).to eq 200
    expect(page).to have_content("Hello World")
  end

  scenario "users can post messages" do
    sign_up
    sign_in
    post_message
    expect(page).to have_content "Faraway land"
  end

  scenario "messages are linked to the author" do
    sign_up
    sign_in
    post_message
    expect(page).to have_content("William")
  end

  scenario "messages display their created time" do
    sign_up
    sign_in
    post_message
    expect(page).to have_content "2017"
  end

end
