feature 'posting a peep' do
  scenario 'user can post a new peep' do
    visit('/')
    click_link 'Sign up'
    fill_in('email', with: 'example@email.com')
    fill_in('password', with: 'password')
    fill_in('name', with: 'Jozef Bloggs')
    fill_in('username', with: 'JoBlo123')
    click_on 'OK'
    click_link 'New peep'
    fill_in('content', with: 'posting test 1')
    click_on 'Submit'
    expect(page).to have_content('posting test 1')
  end
end
