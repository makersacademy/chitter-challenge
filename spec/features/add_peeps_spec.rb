# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature 'add peeps' do 

  scenario 'users can add a peep' do
    
    visit '/peeps/new'
    fill_in 'content', with: "I love peeping!"
    click_button 'Peep!'

    expect(current_path).to eq '/peeps'

    within 'ol#peeps' do
      expect(page).to have_content "I love peeping!"
    end
  end

end