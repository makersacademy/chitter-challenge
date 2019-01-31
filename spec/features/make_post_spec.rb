# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'posting message' do
  scenario 'user can post a message' do
    visit('/')
    expect(page).to have_content "hello chitter"
  end
end
