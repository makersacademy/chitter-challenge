# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature 'Create a bookmark' do
  scenario 'user can enter a post' do
    visit('/')
    fill_in 'message', with: "My first Peep"
    click_button 'submit'
    expect(page).to have_content "My first Peep"
  end

end
