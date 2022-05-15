feature 'user can post on Chitter' do
  scenario 'user posts a message visible on Chitter' do
  
    visit '/home'
    click_button 'New Message'

    expect(current_path).to eq '/peeps/message'

    fill_in :message, with: 'Hooray!'
    click_button 'Submit'
    time = Time.new.strftime('%a, %d %b %Y %H:%M:%S')
    p time

    expect(current_path).to eq '/home'
    expect(page).to have_content 'Hooray!'
    expect(page).to have_content(time)
  end
end
