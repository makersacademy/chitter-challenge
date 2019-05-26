feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('email', with: 'peeper@peep.com')
    fill_in('password', with: '123')
    fill_in('name', with: 'Peppy Peep')
    fill_in('username', with: 'Peepqueen')
    click_button('Submit')

    expect(page).to have_content "Welcome, Peepqueen"
  end
end
