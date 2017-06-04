feature "Posting messages (peeps)" do
  scenario "User can post a message to Chitter" do
    sign_up
    visit "/"
    click_button "Post new Peep"
    fill_in("message_body", with: "First!")
    click_button "Submit"
    expect(page.find('li:nth-child(1)')).to have_content("First!")
  end

  scenario "User posts two messages and sees them in reverse chronological order" do
    sign_up
    visit "/"
    click_button "Post new Peep"
    fill_in("message_body", with: "Second!")
    click_button "Submit"
    click_button "Post new Peep"
    fill_in("message_body", with: "Seco- oh, never mind :(")
    click_button "Submit"
    expect(page.find('li:nth-child(1)')).to have_content("Seco- oh, never mind :(")
    expect(page.find('li:nth-child(2)')).to have_content("Second!")
  end

  scenario "User cannot post a message without being logged in" do
    visit "/"
    expect(page).not_to have_button("Post new Peep")
    sign_up
    expect(page).to have_button("Post new Peep")
  end

  scenario "User posts a message and sees their username next to it" do
    sign_up
    click_button "Post new Peep"
    fill_in("message_body", with: "Say my name")
    click_button "Submit"
    expect(page.find('li:nth-child(1)')).to have_content("Kynosaur")
  end
end
