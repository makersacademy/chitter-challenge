
feature 'Sign up' do 
  scenario 'User can view own peeps' do 
    visit  ('/signup')
    fill_in :username, with: "Goku"
    fill_in :peep, with: "I am the strongest saiyan"
    click_button("Submit")
    # sign_up_and_post
    expect(page).to have_content "Welcome Goku"
    expect(page).to have_content "I am the strongest saiyan"
  end
end
