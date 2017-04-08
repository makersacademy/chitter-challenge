feature 'Add a peep' do

  scenario 'Have the ability to peep (can see peep button)' do
    sign_up
    sign_in
    expect(page).to have_content 'Create Peep!'
  end

  xscenario 'Cannot peep if not logged in' do

  end

  scenario 'Add a specific peep' do
    sign_up
    sign_in
    visit '/peeps/new'
    fill_in 'message', with: 'My first peep'
    click_button 'Post Peep!'

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content 'My first peep'
    end
  end
end
