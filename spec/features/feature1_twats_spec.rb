feature 'Feature 1: sending twats' do
  scenario 'Feature 1: User can send a twat and see it displayed' do

    visit('/')
    fill_in('new_message', with: 'Hello Twatters')
    click_button('Send')
    expect(page).to have_content('Hello Twatters')
  end
end
