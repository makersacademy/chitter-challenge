# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature 'Post a Peep' do 
  scenario '-User posts Peep to Chitter' do
    visit ('/peeps')
    click_button('Peep')
    
    fill_in('message', with: 'Testing the Post a Peep feature')
    
    click_button('Post')
    save_and_open_page
    expect(page).to have_content('Testing the Post a Peep feature')
  end
end

