feature 'user can sign_up for chitter account' do
  scenario 'so that user can post to chitter, they can sign up for an account' do
    visit '/'
    click_button 'Sign up for a Chitter Account'
    # this takes you to '/sign_up'
    fill_in('txt_chit_name', with: 'test5')
    fill_in('txt_chit_user_name', with: 'user5')
    fill_in('txt_chit_email', with: '5test@test.com')
    fill_in('txt_password', with: 'test')
    click_button('Sign Up!')

    expect(page).to have_content 'Congratulations, user5 now has a Chitter Account'
  end
end
