feature 'posting a peep' do
  scenario 'user can write a peep and post it' do
    visit '/peeps/new'
    fill_in 'peep', with: 'Is anybody out there?'
    click_button 'Submit'
    expect(page).to have_content 'Is anybody out there?'
  end
end
