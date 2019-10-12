feature 'Post a peep in chitter' do
  scenario 'user posts a message' do
    visit('/')
    fill_in('message', with: 'Hello Chitter!')
    click_button('Peeps')
    expect(page).to have_content 'Hello Chitter!'
  end
end
