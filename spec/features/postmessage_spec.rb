feature 'Post a message' do
  scenario "user can post a message" do
    visit ('/')
    fill_in('text', with:'This is a test')
    click_button 'Peep!'

    expect(page).to have_content('This is a test')
  end
end
