feature 'Displays peep the user enters' do
  scenario 'Displays test peep' do
    visit ('/')
    fill_in 'peeps', with: 'test peep'
    click_button 'peep'
    expect(page).to have_content('test peep')
  end
end
