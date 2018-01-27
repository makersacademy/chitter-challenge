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
end
