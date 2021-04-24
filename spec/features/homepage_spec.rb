feature 'Home page' do
  scenario 'has a feild to write a peep' do
    visit('/')
    expect(current_path).to eq('/chitter')
    click_button('New Peep')
    fill_in 'peep', with: 'my first peep'
    click_button('Submit')

    expect(current_path).to eq('/chitter')
  end
end
