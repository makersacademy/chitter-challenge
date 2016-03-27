feature 'sign_out_spec: Sign out' do

  before(:each) do
    User.create(name: 'Shane',
                username: 'shane',
                email: 'test@test.com',
                password: 'test1234',
                password_confirmation: 'test1234')
  end

  scenario 'user can log out' do
    sign_in(username: 'shane', password: 'test1234')
    click_button 'Log out'
    expect(page).to have_content 'Thanks for peeping.'
    expect(page).not_to have_content 'Shane'
  end


end
