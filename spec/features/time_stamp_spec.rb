feature 'Peep time feature' do
  before(:each) do
    @time = Time.new
    User.create(name: 'user',
                username: 'userfoo',
                email: 'user@example.com',
                password: 'foobar',
                password_confirmation: 'foobar')
    Peep.create(peep: 'this is a test post',
                user_id: 1, time: @time)
  end
  scenario 'shows time peep was posted' do
    visit '/peeps'
    expect(page).to have_content(@time)
  end
end
