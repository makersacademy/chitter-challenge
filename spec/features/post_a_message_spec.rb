feature 'Post a message' do
  scenario 'User can post a message and see it displayed' do
    sign_up
    fill_in 'message', with: 'An example of a message'
    click_button 'Peep'
    expect(page).to have_content 'An example of a message'
  end
end
