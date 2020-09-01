feature 'Create peep' do
  scenario 'a signed in user can create peeps' do
    User.create(
      email: 'peeping@peepers.com',
      password: 'SuperSecretPassword123'
    )

    visit '/sessions/new'
    fill_in(:email, with: 'peeping@peepers.com')
    fill_in(:password, with: 'SuperSecretPassword123')
    click_button('Sign in')

    click_button('Compose Peep')
    expect(current_path).to eq '/peep/new'
    
    fill_in('peep', with: 'Peeping peepers Peepman!')
    click_button('Peep')

    expect(current_path).to eq '/'
    expect(page).to have_content 'Peeping peepers Peepman!'
  end

  scenario 'a user cannot create a peep if they are not signed in' do
    visit '/'
    expect(page).not_to have_button('Peep')
  end
end