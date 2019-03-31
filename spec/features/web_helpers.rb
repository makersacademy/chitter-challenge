def signup 

  visit '/users/new' 
  fill_in(:name, with: 'alex')
  fill_in(:username, with: 'alexchen')
  fill_in(:email, with: 'alex@hotmail.com')
  fill_in(:password, with: '12345678')
  # save_and_open_page
  click_on('Submit')

end 