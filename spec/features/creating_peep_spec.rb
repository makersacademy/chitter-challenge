# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Creating a peep' do
  scenario 'peep count increases by 1' do
    sign_in
    visit('peeps/new')
    fill_in(:content, with: 'Peep exemplar!')
    expect { click_button('Peep') }.to change { Peep.count }.by(1)
  end
  scenario 'do not allow to peep if not signed in' do
    visit('peeps/new')
    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content('You have to sign in to peep')
  end
end
