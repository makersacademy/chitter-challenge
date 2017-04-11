feature 'User signs out' do

  before(:each) do
    User.create(name: 'Trish', email: 'Trish@person.com',
                username: 'Wizard_Trish', password: 'password',
                password_confirmation: 'password')
  end

  scenario 'while being signed in' do
    sign_in(username: 'Wizard_Trish', password: 'password')
    click_button('Sign out')
    expect(page).to have_content('Till next time!')
    expect(page).not_to have_content('Welcome, Wizard_Trish')
  end
end
