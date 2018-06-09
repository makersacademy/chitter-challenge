# User Story 1
# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Post a peep to Chitter' do
  scenario 'user can write a peep and post it' do
    visit '/'
    fill_in('peep', with: "My first peep")
    click_button('Post')
    expect(page).to have_content "My first peep"
  end
end
