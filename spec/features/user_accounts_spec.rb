
feature 'user accounts' do

  it 'shows a list of users' do
    visit('/users')
    expect(page).to have_content('Hello there, Sally')
  end

  it 'has user records' do
    users = User.all
    p users[0]
  end
end
