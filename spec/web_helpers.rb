def sign_up name, handle, email, password, password_confirmation=password
  visit '/user/new'
  fill_in :name, with: name
  fill_in :handle, with: handle
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
end

def sign_in
  sign_up "Dan Macarthy", "MacDaNNy", "iam@hotmail.com", "123"
  click_button "Sign up"
end

def sign_in_sign_out name, handle, email, password
  sign_up name, handle, email, password
  click_button "Sign up"
  click_button "Sign out"
end

def peep message
  visit '/peep/new'
  fill_in :content, with: message
  click_button 'peep'
end
