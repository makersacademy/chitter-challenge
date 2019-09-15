feature 'Adding a new message' do
  scenario "A user can add a message to the list" do
    visit '/new'
    fill_in('message', with: 'Great to be here')
    click_button('Submit')
    expect(page).to have_content('Great to be here')
  end
end
