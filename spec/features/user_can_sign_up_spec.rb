feature 'User can sign up for Chitter' do
  scenario 'user creates and account on Chitter' do
    create_account
    expect(current_path).to eq '/home'
    expect(page).to have_content 'Howdy, @ana! Peep now or forever hold your piss (Oh, noooo!)'
  end
end
