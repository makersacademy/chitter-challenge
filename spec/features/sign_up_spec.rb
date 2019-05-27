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

feature "using a non-unique email" do
  scenario "should return you to the sign up page with a prompt" do
    sign_up_user
    sign_up_another_user
    expect(page).to have_content('Email already in use')
  end
end
