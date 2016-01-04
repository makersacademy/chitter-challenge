feature 'Send Peep' do

  # As a Maker
  # So that I can let people know what I am doing
  # I want to post a message (peep) to chitter

  scenario 'a user can send a peep' do
    sign_up
    send_peep
    expect(current_path).to eq '/peeps'
    expect(page).to have_content('This is my first peep!')
    expect(page).to have_content('From: Mr Example, @3xampl3')
  end
end
