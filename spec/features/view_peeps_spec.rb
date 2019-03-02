feature 'viewing peeps feed' do
  scenario 'shows a list of peeps in reverse date order' do

    sign_up_for_chitter
    
    log_in_to_chitter
    
    visit '/peeps'
    click_button 'Make a Peep'

    fill_in :text, with: 'First Peep...'
    click_button 'Peep!'

    visit '/peeps'
    click_button 'Make a Peep'

    fill_in :text, with: 'Second Peep...'
    click_button 'Peep!'

    visit '/peeps'
    click_button 'Make a Peep'

    fill_in :text, with: 'Third Peep...'
    click_button 'Peep!'

    # log out
    click_button 'Log out!'

    expect(first('.peep')).to have_content 'Third Peep...'
  end
end
