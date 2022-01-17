feature 'Posting a peep' do
  scenario 'a posted peep is displayed with time' do
    visit '/peeps'
    fill_in 'peep', with: 'Hello World!'
    click_button 'Peep!'
    expect(page).to have_content 'Hello World!' 
    expect(page).to have_content '31/12/1999 23:59'
  end
end

feature 'Posting three peeps' do
  scenario 'peeps display in reverse chronology' do
    visit '/peeps'
    fill_in 'peep', with: 'Bottom'
    click_button 'Peep!' 
    fill_in 'peep', with: 'Middle'
    click_button 'Peep!' 
    fill_in 'peep', with: 'Top'
    click_button 'Peep!'
    
    expect(all('.peep').first).to have_content 'Top'
    expect(page).to have_content 'Middle'
    expect(all('.peep').last).to have_content 'Bottom'
  end
end
