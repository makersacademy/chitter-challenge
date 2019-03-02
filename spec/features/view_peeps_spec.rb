feature 'viewing peeps feed' do
  scenario 'shows a list of peeps in reverse date order' do
       
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

    expect(first('.peep')).to have_content 'Third Peep...'
  end
end
