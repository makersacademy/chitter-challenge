feature 'Compose peep' do

  scenario 'I can compose a new peep' do
    visit '/peeps/new'
    fill_in 'user_name',   with: 'Jeff'
    fill_in 'user_peep', with: 'This is my second peep!'
    click_button 'Send Peep!'

    # we expect to be redirected back to the links page
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('This is my second peep!')
    end
  end
end
