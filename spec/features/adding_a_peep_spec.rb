# User Story 1
# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Adding a peep to chitter' do
  scenario 'User adds a peep to chitter' do
    visit '/'
    fill_in('peep', with: 'this is my first peep')
    click_button('Post')
    # Peep.post(peep: 'this is my first peep')
    expect(page).to have_content 'this is my first peep'

  end
end
