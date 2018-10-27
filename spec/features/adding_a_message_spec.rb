feature 'Feature - Adding a new message' do
  scenario 'a user can create a new message' do
    visit('/messages/new')
    fill_in('message', with: "This is a new message")
    click_button('Submit')

    expect(page).to have_content "This is a new message"
  end
end
