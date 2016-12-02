
RSpec.feature "Maker Sign Up" do

  scenario "should be able to sign up" do
    sign_up
    expect(page).to have_content "Welcome Django"
  end


  def sign_up name: "Django Tarantino",
              user_name: "realDjango",
              email: "django@unchained.com",
              password: "i_hate_honkys"

    visit '/sign_up'
    fill_in 'name', with: name
    fill_in 'user_name', with: user_name
    fill_in 'email', with: email
    fill_in 'password', with: password

    click_button 'submit'
  end

end
