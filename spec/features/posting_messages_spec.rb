feature 'Creating messages' do

  scenario 'while logged in, I can post a message' do
    sign_up
    post_tweep

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
    visit 'messages'
    expect(page).not_to have_content('Hello, world!')
  end

  scenario 'I want to see the time at which the post was made' do
    sign_up
    visit '/messages/new'
    fill_in 'peep',   with: 'Hello, world!'
    click_button 'Post peep'

    within 'ul#messages' do
      expect(page).to have_content("Posted at: #{Time.now.strftime("%Y-%m-%d %H:%M:%S")}")
    end
  end
end
