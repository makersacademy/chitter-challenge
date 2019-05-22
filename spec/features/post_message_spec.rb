feature 'posting a message on chitter' do
  scenario 'creating a new message to post of chitter' do
    visit '/chitter'
    fill_in "text", with: "This is my first ever peep"
    click_button "Post Peep!"
    expect(page).to have_content "This is my first ever peep"
  end

  # scenario 'when logged in, save messages as me' do
  #   sign_up_and_login
  #
  #   fill_in "text", with: "This is the peep of the day"
  #   click_button "Post Peep!"
  #   expect(page).to have_content "This is the peep of the day"
  #   expect(page).to have_content "Posted by sami"
  # end

  scenario 'when not logged in, save messages as unknown' do
    visit '/chitter'
    fill_in "text", with: "This is the peep of the day"
    click_button "Post Peep!"
    expect(page).to have_content "This is the peep of the day"
    expect(page).to have_content "Posted by unknown"
  end
end
