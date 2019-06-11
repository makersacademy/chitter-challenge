feature 'sign up' do
  scenario 'user can sign up by entering user name and password' do
    visit('/register')
    fill_in('user_name', with: 'taj485')
    fill_in('password', with: 'epictaj')
    click_button('submit')
    expect(page).to have_content ("Welcome")
  end
end
