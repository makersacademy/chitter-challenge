feature 'Create Peep' do
  scenario 'a user can peep when signed up' do
    sign_up
    send_peep
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content 'Oh look I can peep like a pro'
      expect(page).to have_content 'Peeped By: Test User @testuser'
    end
  end
end
