feature 'create a peep' do
  scenario 'signed in user may create a peep' do
    sign_up
    expect(current_path).to eq '/peeps/new'
    fill_in 'peep', with: 'This is the first peep'
    click_button 'Peep!'
    expect(current_path).to eq '/peeps'
      within 'ul#peeps' do
        expect(page).to have_content 'This is the first peep'
      end
  end

  scenario 'peeps should be assigned to a user' do
    sign_up
    fill_in 'peep', with: 'This is Ed\'s peep'
    click_button 'Peep!'
    within 'ul#peeps' do
      expect(page).to have_content 'Edward peeped: This is Ed\'s peep'
    end
  end
end
