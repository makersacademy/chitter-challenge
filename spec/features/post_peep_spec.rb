# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature 'posting a message' do
  scenario 'user can post a message to chitter' do
    visit('/chitter/new')
    fill_in('text', with: 'This is my first peep!')
    click_button('Submit')
    expect(page).to have_content('This is my first peep!')
  end
end