feature 'homepage' do
  scenario 'Welcome' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter')
  end

  scenario 'add peep' do
    visit('/')
    fill_in 'text', with: 'Otters are cute'
    click_button 'Peep'
    expect(page).to have_content 'Otters are cute'
  end

  scenario 'views all latest peeps' do
    visit('/')
    fill_in 'text', with: 'Otters are cute'
    click_button 'Peep'
    fill_in 'text', with: 'But Squirels are better'
    click_button 'Peep'
    fill_in 'text', with: 'Yo wadddup' 
    click_button 'Peep'
    expect(page).to have_content 'Otters are cute'
    expect(page).to have_content 'But Squirels are better'
    expect(page).to have_content 'Yo wadddup'
  end

  scenario 'see the time by each peep' do
    visit('/')
    fill_in 'text', with: 'Otters are cute'
    click_button 'Peep'
    fill_in 'text', with: 'But Squirels are better'
    click_button 'Peep'
    fill_in 'text', with: 'Yo wadddup' 
    click_button 'Peep'
    expect(page).to have_content 'Otters are cute - 26 September 2020'
    expect(page).to have_content 'But Squirels are better - 25 September 2020'
    expect(page).to have_content 'Yo wadddup - 24 September 2020'
  end
  
end