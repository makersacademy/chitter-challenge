feature 'able to add peep' do
  scenario 'when logged in' do
    visit('/')
    sign_up('user', 'user@gmail.com', '1234', '1234')
    add_peep('this is my first peep')
    expect(page).to have_content('this is my first peep')
  end
end
