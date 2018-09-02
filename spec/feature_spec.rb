# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature 'Posting Peeps' do 
  scenario 'user can post a peep to chitter' do
    visit '/'
    expect(page).to have_content 'Chitter'
    fill_in :peep, with: 'Hello world!'
    click_button 'Post'
    expect(page).to have_content 'Hello world!'
  end
end