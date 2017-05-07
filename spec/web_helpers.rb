def sign_up
  visit 'users/new'
  expect(page.status_code).to eq 200
  fill_in :name,      with: "Martina Navratilova"
  fill_in :username,  with: "frenchopen_booo"
  fill_in :email,     with: "allcourter@allsurfaces.com"
  fill_in :password,  with: "greatvolleys"
  click_button 'Sign up'
end
