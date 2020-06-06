feature 'has an opening browser page' do
  it 'Says welcome to Chitter on the home page' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter')
  end

  it 'Has a button a field to create a new peep' do
    visit('/')
    expect(page).to have_field('new_peep')
  end
end

feature 'Peep' do
  it 'Shows all peeps in reverse chronological order' do
    visit('/')
    fill_in 'new_peep', with: 'This is my first peep'
    click_button('Peep')
    fill_in 'new_peep', with: 'tis but a peep'
    click_button('Peep')
    fill_in 'new_peep', with: 'no body expects the spanish inquisition'
    click_button('Peep')
    expect(page).to have_content('This is my first peep')
    expect(page).to have_content('tis but a peep')
    expect(page).to have_content('no body expects the spanish inquisition')
  end
end
