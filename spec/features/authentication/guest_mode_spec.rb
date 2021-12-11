feature 'guest mode' do
  scenario 'when viewing messages without logging in' do
    visit '/'
    click_button 'Continue as guest'
    expect(page).to_not have_content "Welcome"
    expect(page.current_path).to eq('/messages')
  end

  scenario 'posts have guest as author' do
    visit('/messages')
    fill_in('text', with: 'Hello World!')
    click_button('Submit')
    expect(first('#author').text).to eq 'Posted by Guest'
  end
end