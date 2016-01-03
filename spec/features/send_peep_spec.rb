feature 'Send Peep' do
  scenario 'a user can send a peep' do
    sign_up
    send_peep
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content('This is my first peep!')
      expect(page).to have_content('From: Mr Example - @3xampl3')
    end
  end
end
