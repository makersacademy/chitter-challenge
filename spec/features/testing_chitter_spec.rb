feature 'Checking the homepage' do
  scenario 'holds the welcome' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter you chatter')
  end
  scenario 'displays my peep' do
    visit('/')
    click_on '+Peep'
    fill_in 'peep_text', with: "My first peep!" 
    click_on 'Save'
    expect(page).to have_content('My first peep!')
  end

  scenario 'displays my latest peep first' do
    visit('/')
    click_on '+Peep'
    fill_in 'peep_text', with: "My first peep!" 
    click_on 'Save'
    click_on '+Peep'
    fill_in 'peep_text', with: "My second peep!" 
    click_on 'Save'
    expect(first('.comment')).to_not have_content('My first peep!')
    expect(first('.comment')).to have_content('My second peep!')
  end

  scenario 'displays the time of creation next to the peep' do
    visit('/')
    click_on '+Peep'
    fill_in 'peep_text', with: "My first peep!" 
    click_on 'Save'
    expect(page).to have_content('created at')
  end
end