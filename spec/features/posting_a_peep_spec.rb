feature 'Posting a peep' do
  scenario 'a posted peep is displayed' do
    visit '/peeps'
    fill_in 'peep', with: 'Hello World!'
    click_button 'Peep!'
    expect(page).to have_content 'Hello World!'
  end
end