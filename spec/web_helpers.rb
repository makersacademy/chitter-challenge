def sign_up
  visit 'users/new'
  expect(page.status_code).to eq 200
  fill_in :name,      with: "Martina Navratilova"
  fill_in :username,  with: "frenchopen_booo"
  fill_in :email,     with: "allcourter@allsurfaces.com"
  fill_in :password,  with: "greatvolleys"
  fill_in :password_confirmation,  with: "greatvolleys"
  click_button 'Sign up'
end

def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end
