feature 'Viewing posts' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter!"
  end

  scenario 'seeing posts on page' do
    Message.create(content: "This is a test message")
    Message.create(content: "This is a second test message")

    visit('/')
    expect(page).to have_content 'This is a test message'
    expect(page).to have_content 'This is a second test message'
  end

  scenario 'seeing posts in reverse chronological order' do
    Message.create(content: "This message was written first")
    Message.create(content: "This message was written second")
    Message.create(content: "This message was written third")

    visit('/')
    expect(page.all('.message')[0]).to have_content "This message was written third"
    expect(page.all('.message')[1]).to have_content "This message was written second"
    expect(page.all('.message')[2]).to have_content "This message was written first"
  end

  scenario 'shows timestamp on peeps' do
    Message.create(content: "Test message", time: "2018-10-26 12:20:00 +0100")

    visit('/')
    expect(page).to have_content "26/10/18 12:20: Test message"
  end

  scenario 'shows name and username on peeps' do
    visit('/')
    click_button 'Sign Up'

    expect(current_path).to eq '/users/sign-up'

    fill_in 'name', with: 'Melissa Sedgwick'
    fill_in 'username', with: 'mel_01'
    fill_in 'email', with: 'melissa@test.com'
    fill_in 'password', with: 'password123'
    click_button 'Submit'
    click_button 'Write Peep'
    fill_in 'content', with: "Writing a new peep"
    click_button 'Post'

    expect(page).to have_content "Melissa Sedgwick (@mel_01) wrote:"
  end

end
