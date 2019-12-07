feature "testing buttons" do

  scenario "clicking the sign up button" do
    visit '/'
    click_button 'sign_up'
    expect(page).to have_content 'Register'
  end

end