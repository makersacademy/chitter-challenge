feature 'Homepage' do
  scenario 'displays a welcome message' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter!'
  end
end

feature 'viewing Tweets' do
  scenario 'I can see all tweets on one page' do
    Tweet.create(subject: 'New Tweet', text: 'This is a new tweet')
    visit('/tweets')
    expect(page).to have_content('New Tweet')
  end

  scenario 'Creating new tweets' do
    visit('/tweets/new')
    fill_in 'subject', with: "What I'm doing"
    fill_in 'text', with: "Coding"
    click_button 'Tweet'

    expect(current_path).to eq '/tweets'

    expect(page).to have_content "What I'm doing"
  end
end
