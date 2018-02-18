feature 'See who has posted' do
  scenario 'User can post a peep and see their name and handle above it' do
    sign_up
    fill_in 'message', with: 'An example of a message'
    click_button 'Peep'
    expect(page).to have_content "Daniel said:"
  end
end
