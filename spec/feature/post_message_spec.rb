feature 'Be able to post messages' do
  scenario 'Post a message onto a chitter' do
    visit('/')
    expect(page.status_code).to eq 200
    fill_in 'message', with: 'Hello, Chitter!'
    click_button('Submit')
    expect(page).to have_content('Hello, Chitter!')
  end
end
