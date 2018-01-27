require 'timecop'

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
    create_tweet
    expect(current_path).to eq '/tweets'
    expect(page).to have_content "What I'm doing"
  end
end

feature 'Signing Up' do
  scenario 'User signs up from landing page' do
    sign_up
    expect(current_path).to eq '/tweets'
  end

  scenario 'user sees own user name on tweets upon sign up' do
    sign_up
    expect(page).to have_content 'Welcome, @lewis!'
  end

  scenario 'user count increases by 1 on sign up' do
    sign_up
    expect { sign_up }.to change(User, :count).by(1)
  end
end
