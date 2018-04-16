feature 'Adding peeps' do

  scenario 'Add a peep, see a peep' do
    create_user_tester
    click_button 'Peep!'
    fill_in('content', :with => 'Peep!')
    click_button 'Submit'
    expect(page).to have_content "Peep!"
  end

  scenario 'Add a peep, see a users naem' do
    create_user_tester
    click_button 'Peep!'
    fill_in('content', :with => 'Peep!')
    click_button 'Submit'
    expect(page).to have_content "Tester"
  end

end
