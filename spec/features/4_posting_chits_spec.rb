feature 'User Posts Chits' do
  scenario 'can post a chit' do
    user_sign_up
    fill_in('chit_text', with: "I'm trapped in this little box…but at least the doctor made me look GOOD!")
    click_button('Chit!')
    expect(page).to have_content("I'm trapped in this little box…but at least the doctor made me look GOOD!")
  end
end
