feature 'Post a peep in chitter' do
  scenario 'user sign up and posts a message' do
    visit('/')
    click_button('Sign up')
    sign_up
    fill_in('message', with: 'Hello Chitter!')
    click_button('Peeps')
    expect(page).to have_content 'Hello Chitter!'
  end
end
