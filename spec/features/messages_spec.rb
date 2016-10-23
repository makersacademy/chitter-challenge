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
    sign_in(email: "wsmith@gmail.com", password: "123456")
    click_button('Post a Message')
    fill_in('title', with: "Faraway land")
    fill_in('content', with: "Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.")
    click_button('Submit')
    expect(page).to have_content "Faraway land"
  end

  scenario "messages are linked to the author" do
    sign_up
    sign_in(email: "wsmith@gmail.com", password: "123456")
    click_button('Post a Message')
    fill_in('title', with: "Alien")
    fill_in('content', with: "We need to hack into alien's brain")
    click_button('Submit')
    current_user = User.first
    expect(current_user.messages.map(&:title)).to include("Alien")
  end

end
