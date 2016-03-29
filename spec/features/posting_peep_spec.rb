feature 'posting peep' do
  scenario 'page has form to peep' do
    visit '/post'
    expect(page).to have_field 'content'
    expect(page).to have_button 'Submit'
  end

  xscenario 'creates a new peep with form' do
    visit '/post'
    fill_in :content, with: 'Hello'
    fill_in :username, with: 'Jazzy'
    click_button 'Submit'
    expect(current_path).to eq '/peep'
    within 'ul#peeps' do
      expect(page).to have_content('Hello')
    end
  end
end
