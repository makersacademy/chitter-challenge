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
  it 'confirms when a peep has been saved' do
    visit('/')
    fill_in 'new_peep', with: 'This is my first peep'
    click_button('Peep')
    expect(page).to have_content('Peep saved')
  end
end