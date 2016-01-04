feature 'peep displayed in correct format' do
  before(:each) do
    User.create(name: 'user',
                username: 'userfoo',
                email: 'user@example.com',
                password: 'foobar',
                password_confirmation: 'foobar')
    Peep.create(peep: 'this is a test post 1',
                user_id: 1, time: Time.new)
  end
  scenario 'peeps show in reverse chronological order' do
    sign_in(username: 'userfoo', password: 'foobar')
    peep_post
    expect(page).to have_content('This is a test post 2')
    expect(page).to have_content('this is a test post 1')
  end
end
