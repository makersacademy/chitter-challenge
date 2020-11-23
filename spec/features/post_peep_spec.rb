require 'pg'

feature 'post a peep' do 
  scenario 'post a peep and I see it apear on my feed' do
    visit('/')
    fill_in :username, with:'Rafa'
    click_button 'Log in!'
    fill_in :peepbox, with:'It is Wednesday my dudes'
    click_button 'Peep!'
    expect(page).to have_content 'It is Wednesday my dudes'
  end
end


# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter