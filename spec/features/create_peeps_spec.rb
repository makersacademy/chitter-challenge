feature 'create a new peep' do
  scenario 'a user can create a new peep' do
    sign_up
    click_button 'New peep'
    fill_in 'peep', with: 'This is a brand new peep - wayhay!!!'
    click_button 'Submit'
    expect(page).to have_content 'This is a brand new peep - wayhay!!!'
  end
end
