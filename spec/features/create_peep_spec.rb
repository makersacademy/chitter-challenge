feature 'Create peep' do
  scenario 'a signed in user can create peeps' do
    @fake_time = Time.now
    Time.stub(:now) { @fake_time }

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
    expect(page).to have_content 'peeping@peepers.com'
    expect(page).to have_content "#{Time.now.strftime("%Y/%m/%d %k:%M")}"
  end

  scenario 'a user cannot create a peep if they are not signed in' do
    visit '/'
    expect(page).not_to have_button('Peep')
  end
end
