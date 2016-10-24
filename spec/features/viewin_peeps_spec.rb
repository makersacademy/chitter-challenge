feature 'Viewing peeps' do
  before(:all) do
    user1 = User.create(username: 'myusername2', email: 'myemail2@email.com', name: 'myname2', password: 'mypassword2')
    Peep.create(text: 'I am feeling good', created_at: Time.new, user: user1)
  end

  scenario 'I can see existing peeps on the home page' do
    visit '/'
    expect(page).to have_content('I am feeling good')
  end

  scenario 'I can see existing peeps on the peeps page' do
    visit '/'
    sign_up
    expect(page).to have_content('I am feeling good')
  end
end
