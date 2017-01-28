# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature 'add peeps' do 

  scenario 'users can add a peep' do
    sign_up
    sign_in
    click_button 'Get Peeping!'
    fill_in 'content', with: "I love peeping!"
    click_button 'Peep!'

    expect(current_path).to eq '/peeps'

    within 'ol#peeps' do
      expect(page).to have_content "I love peeping!"
    end
  end

end