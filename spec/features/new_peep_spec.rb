# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature 'Adding a message (peep)' do
  scenario 'Maker can post a peep to chitter' do
    visit('/peeps/new-peep')

    fill_in('message', with: 'my first peep')
    click_button 'submit'

    expect(current_path).to eq '/peeps' 
    expect(page).to have_content 'my first peep'
  end
end
