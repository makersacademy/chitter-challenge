feature 'Add a new peep' do
  scenario 'user sees the new peep button on the /peeps page' do
    user_sign_up

    visit '/peeps'
    expect(page).to have_button 'Submit'
  end

  scenario 'user can write a peep and add it to list of peeps' do
    user_sign_up

    visit '/peeps'
    fill_in('message', with: 'This is a test peep')
    click_button 'Submit'
    expect(page).to have_content 'This is a test peep'
  end
end
