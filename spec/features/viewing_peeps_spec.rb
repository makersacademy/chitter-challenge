feature 'Viewing peeps' do
  before do
    user = User.create(
      username: 'amanzano',
      password: 'pass',
      password_confirmation: 'pass',
      email: 'arnold@myemail.com',
      name: 'Arnold Manzano')
    Peep.create(
      message: 'This is my peep',
      datetime: Time.now,
      user: user)
  end

  scenario 'People can view peeps' do
    visit('/peeps')
    expect(page).to have_content('This is my peep')
    expect(page).to have_content('Posted by: amanzano')
  end
end
