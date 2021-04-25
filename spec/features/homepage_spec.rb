feature 'Home page' do
  scenario 'has a feild to write a peep' do
    visit('/')
    expect(current_path).to eq('/chitter')
    click_button('New Peep')
    fill_in 'peep', with: 'my first peep'
    click_button('Submit')

    expect(current_path).to eq('/chitter')
  end

  scenario 'shows all the peeps newest first' do
    visit('/')
    click_button('New Peep')
    fill_in 'peep', with: 'my first peep'
    click_button('Submit')
    expect(page).to have_content('my first peep')
    
    click_button('New Peep')
    fill_in 'peep', with: 'my second peep'
    click_button('Submit')

    expect(page).to have_content('my second peep')
  end
end
