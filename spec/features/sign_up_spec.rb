feature "clicking 'Sign Up'" do
  scenario "should take you to a sign up page" do
    visit '/'
    click_button 'Sign up'
    expect(page).to have_field('email')
    expect(page).to have_field('password')
    expect(page).to have_field('name')
    expect(page).to have_field('username')
  end
end
