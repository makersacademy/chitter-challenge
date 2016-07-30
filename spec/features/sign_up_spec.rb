feature 'Sign up' do

  scenario 'a visitor can sign up' do
    sign_up
    expect(page).to have_content 'Welcome, nomi811'
  end
end
