feature 'add peep' do
  scenario 'to homepage' do
    visit('/peeps')
    fill_in :experience, with: "Life is good"
    click_button 'Share'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content "Life is good"
  end
end
