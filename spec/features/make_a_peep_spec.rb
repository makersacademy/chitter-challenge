feature 'make a peep' do
  let(:enter_user) { User.create(
    email: 'test@example.com',
    username: 'tester',
    name: 'John Doe',
    password: 'hunter123')
  }
  scenario 'user can make a peep' do
    enter_user
    visit '/sign_in'
    fill_in('username', with: 'tester')
    fill_in('password', with: 'hunter123')
    click_button('Sign in')
    visit('/new_peep')
    fill_in('peep', with: 'Testing 123')
    click_button('Make Peep')

    expect(page).to have_content 'Testing 123'
  end
end
