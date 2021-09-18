feature 'Sign up' do 
  scenario 'View own peeps' do 
    visit  ('/signup')
    fill_in :user_name, with:("Goku")
    click_button("Submit")
    expect(page).to have_content "Welcome Goku"
  end
end
