require_relative '../../lib/app'

feature 'post tweets' do
  scenario 'write tweet and post' do
    visit('/tweets')
    fill_in('tweet', with: 'this is a tweet')
    click_button('Post')
    expect(page).to have_content('this is a tweet')
  end
end