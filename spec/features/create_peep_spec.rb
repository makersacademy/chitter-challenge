feature 'Create peep' do
  scenario 'User creates peep' do
    visit('/')
    click_button('Compose Peep')
    expect(current_path).to eq '/peep/new'
    
    fill_in('peep', with: 'Peeping peepers Peepman!')
    click_button('Peep')

    expect(current_path).to eq '/'
    expect(page).to have_content 'Peeping peepers Peepman!'
  end
end