# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Post a peep' do
  scenario 'The user can post a new peep' do
    visit '/'
    fill_in 'peep_content', with: "First peep w00t!!"
    click_button 'Peep'
    peeps = Peep.all
    expect(peeps.first.content).to eq "First peep w00t!!"
  end
end
