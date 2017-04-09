module SessionHelpers

  def sign_up
    visit '/'
    click_button 'Sign up'
    fill_in 'name', with: "Sam"
    fill_in 'email', with: "sam@sam.sam"
    fill_in 'user_name', with: "sammybo1"
    fill_in 'password', with: "sam1"
    fill_in 'confirm_password', with: "sam1"
    click_button "Sign up"
  end

  def sign_in
    visit '/'
    click_button 'Sign in'
    fill_in :email, with: 'sam@sam.sam'
    fill_in :password, with: 'sam1'
    click_on "Sign in"
  end
end
