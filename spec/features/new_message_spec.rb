feature 'Adding a new message' do
  scenario "A user can add a message to the list" do
    visit '/new'
    fill_in('message', with: 'Great to be here')
    fill_in('title', with: 'Test Title')
    click_button('Submit')
    expect(page).to have_content('Test Title', 'Great to be here')
  end
end
