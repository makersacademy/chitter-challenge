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

end
