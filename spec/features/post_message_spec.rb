feature 'posting a message on chitter' do
  scenario 'creating a new message to post of chitter' do
    visit '/chitter'
    fill_in "text", with: "This is my first ever peep"
    click_button "Post Peep!"
    expect(page).to have_content "This is my first ever peep"
  end
end
