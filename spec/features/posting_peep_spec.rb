# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'post a peep' do
  scenario 'post a message to chitter' do
    enter_peep
    expect(current_path).to eq '/peeps'
    expect(page).to have_content('test message')
  end
end
