feature "adding posts" do
  scenario "posting a new message" do
    visit('/')
    fill_in 'username', with: 'tina123'
    fill_in 'message', with: 'I am having a really great day today!'
    click_button("Send")
    expect(page).to have_content('I am having a really great day today!')
  end
end