feature 'Peep Entry' do
  scenario 'user has option to enter a peep' do
    visit('/add_peep')
    expect(page).to have_field 'content'
    expect(page).to have_button 'Submit'
  end

  scenario 'user signs up and can click button to peep' do
    sign_up_test
    expect(page).to have_button "Let's do a peep"
  end
end
