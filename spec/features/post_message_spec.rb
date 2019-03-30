# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Post a message' do
  scenario 'I want to be prompted to compose a message' do
    visit '/message/new'
    expect(page).to have_content 'Compose a new peep'
  end
end
