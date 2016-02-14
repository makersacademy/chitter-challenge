
feature 'posting peeps' do

  scenario 'can see the peep on the home page' do
    sign_up_good
    fill_in 'peep_input', with: 'Hello this is my peep'
    click_button 'Peep'
    expect(page).to have_content 'Hello this is my peep'
  end

  scenario 'cannot be done when not logged in' do
    visit '/'
    fill_in 'peep_input', with: 'Hello this is my peep'
    click_button 'Peep'
    expect(page).to have_content 'You need to login to peep'
  end

  scenario 'peeps are shown in reverse cronilogical order' do
    sign_up_good
    fill_in 'peep_input', with: 'Hello this is my peep'
    click_button 'Peep'
    fill_in 'peep_input', with: 'this is the second peep'
    click_button 'Peep'
    expect(page).to have_content 'this is the second peep Hello this is my peep'
  end
end
