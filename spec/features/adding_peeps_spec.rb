feature 'Adding Peeps' do
  scenario 'I want to add peeps to chitter' do
    visit '/peeps/new'
    fill_in :peep, with: 'peep1234'
    click_button 'Submit'
    expect(current_path).to be '/feed'
    expect(page).to have_content 'peep1234'
  end
end
