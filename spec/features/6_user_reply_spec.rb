feature 'User Reply' do
  scenario '' do
    user_sign_up
    first_chit
    click_button('Log out')
    second_user_sign_up
    fill_in('reply_text', with: 'first reply')
    click_button('Reply')
    expect(page).to have_content('first reply')
  end
end
