feature 'user can post a message on Chitter' do

  scenario 'user post a message and it is visible on Chitter board' do

    visit '/board'
    click_button 'New message'
    expect(current_path).to eq '/peeps/message'
    fill_in :message, with: 'Hello World!'
    click_button 'Publish'
    time = Time.new.strftime('%a, %d %b %Y %H:%M:%S')
    p time
    expect(current_path).to eq '/board'
    expect(page).to have_content 'Hello World!'
    expect(page).to have_content(time)

  end

end
