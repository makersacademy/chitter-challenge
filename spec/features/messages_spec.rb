require 'spec_helper'

feature "Post messages" do

  scenario "users can view messages" do
    Message.create(title: 'Hello World', content: "Just want to say hi")
    visit '/messages'
    expect(page.status_code).to eq 200
    expect(page).to have_content("Hello World")
  end

  skip scenario "users can post messages" do
    visit '/messages'
    click_button('Post a Message')
    fill_in('title', with: "Faraway land")
    fill_in('message', with: "Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.")
    click_button('Submit')
    expect(page).to have_content "Faraway land"
  end



end
