feature 'Be able to post messages' do
  scenario 'Post a message onto a chitter' do
    visit('/index')
    expect(page.status_code).to eq 200
    fill_in 'message', with: 'Hello, Chitter!'
    click_button('Submit')
  end
end
