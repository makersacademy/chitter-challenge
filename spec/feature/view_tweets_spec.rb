require_relative '../../lib/app'

feature 'view tweets' do
  scenario 'see tweets on homepage' do
    post_test_tweets
    visit('/tweets')
    expect(page).to have_content('test tweet 1')
  end
end