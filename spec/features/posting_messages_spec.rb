feature 'Creating messages' do

  scenario 'while logged in, I can post a message' do
    sign_up
    visit '/messages/new'
    fill_in 'peep',   with: 'Hello, world!'
    click_button 'Post peep'

    expect(current_path).to eq '/messages'

    within 'ul#messages' do
      expect(page).to have_content('Peep: Hello, world!')
      expect(page).to have_content('Name: Joe Giant')
      expect(page).to have_content('Username: jollygreengiant')
    end
  end

  scenario 'while not logged in, I can\'t post a message' do
    visit 'messages/new'
    fill_in 'peep',   with: 'Hello, world!'
    click_button 'Post peep'
    expect(current_path).to eq('/users/new')
  end
end
