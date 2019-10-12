feature 'Posting messages' do
  scenario 'Visiting index page' do
    visit ('/')
    expect(page).to have_content "Chitter"
    expect(page).to have_content "What's happening?"
    fill_in('message', with: 'Hello')
    click_button('Submit')
  end
end
