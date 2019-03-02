feature 'create new peep' do
  scenario 'create a new peep' do
    visit '/chitter/peep/new'
    fill_in 'message', with: 'This is a new peep'
    click_button 'Submit'
    expect(page).to have_content 'This is a new peep'
  end
end
