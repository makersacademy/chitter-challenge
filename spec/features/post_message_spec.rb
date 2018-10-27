# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Posting peeps' do
  scenario 'A user can post a peep to chitter' do
    visit '/new'

    expect(page).to have_content 'Chitter'
  end
end
