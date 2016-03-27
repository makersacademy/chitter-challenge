def sign_up
  visit '/sign-up'
  fill_in :name, with: "John Doe"
  fill_in :email, with: "me@email.com"
  fill_in :password, with: "asd123"
  fill_in :password_confirmation, with: "asd123"
  click_button 'Sign up'
end
def sign_up_pw_mismatch
  visit '/sign-up'
  fill_in :name, with: "John Doe"
  fill_in :email, with: "me@email.com"
  fill_in :password, with: "asd123"
  fill_in :password_confirmation, with: "123asd"
  click_button 'Sign up'
end
def sign_up_invalid_email
  visit '/sign-up'
  fill_in :name, with: "John Doe"
  fill_in :email, with: "invalidemail.com"
  fill_in :password, with: "asd123"
  fill_in :password_confirmation, with: "asd123"
  click_button 'Sign up'
end

def sign_up_no_email_or_name
    visit '/sign-up'
    fill_in :name, with: ""
    fill_in :email, with: ""
    fill_in :password, with: "asd123"
    fill_in :password_confirmation, with: "asd123"
    click_button 'Sign up'
  end

def sign_up_registered_email
    visit '/sign-up'
    fill_in :name, with: "John Doe"
    fill_in :email, with: "me@email.com"
    fill_in :password, with: "asd123"
    fill_in :password_confirmation, with: "asd123"
    click_button 'Sign up'
end
