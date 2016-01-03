feature 'Create Peep' do
  scenario 'a user can peep when signed up' do
    sign_up
    send_peep
    expect(current_path).to eq '/peeps'
    within 'main' do
      expect(page).to have_content 'Oh look I can peep like a pro'
      expect(page).to have_content 'Peeped By: Test User @testuser'
    end
  end

  scenario 'when not signed in you cannot peep' do
    visit '/peeps/new'
    expect { send_peep }.not_to change { Peep.count }
    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content 'Please sign in to peep'
  end
end
