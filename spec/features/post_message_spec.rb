feature 'user can post a message on Chitter' do

  scenario 'user post a message and it is visible on Chitter board' do

    visit '/board'
    click_button 'New message'
    fill_in :message, with: 'Hello World!'
    click_button 'Publish'
    expect(current_path).to eq '/board'
    expect(page).to have_content 'Hello World!'

  end

end
