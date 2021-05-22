# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature 'post peep' do
  scenario 'a user can post a new peep' do
    visit ('/peeps/new')
    fill_in('peep', with: 'This is my first peep!')
    click_button('Post peep')

    expect(current_path).to eq('/peeps')
    expect(page).to have_content('This is my first peep!')
  end
end 