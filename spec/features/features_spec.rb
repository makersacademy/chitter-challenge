# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'posting a message' do
  scenario 'user posts a message on the page' do
    visit('/')
    fill_in 'content', with: 'Hello World'
    click_button 'Post'
    visit('/posts')
    expect(page).to have_content 'Hello World'
  end
end
