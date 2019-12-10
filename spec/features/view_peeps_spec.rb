feature 'Viewing Peeps' do
  scenario 'user can see all peeps' do
    user_sign_up

    user = User.create(email: 'bob@test.com', handle: 'bob', password: 'password')
    peep = Peep.create(message: 'Test peep', user_id: user.id)

    visit '/peeps'

    expect(page).to have_content "What's on your mind?"
    expect(page).to have_content 'Test peep'
  end
end
