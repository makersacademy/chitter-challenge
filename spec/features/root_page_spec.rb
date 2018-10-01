xfeature 'set up' do
  scenario 'visit page' do
    visit '/'
    click_on 'Login'
    expect(page).to have_text ""
  end
end

xfeature 'registration' do
  scenario 'a user can sign up' do
    visit '/'
    click_on 'Sign Up'
    fill_in('username', with: 'BatesFan')
    fill_in('email', with: 'alfredhitchcock@hotmail.com')
    fill_in('password', with: 'alfredosauce')
    click_button('Submit')
    expect(page).to have_content "Ahoy, BatesFan!"
  end
end