feature 'user signs up at sign up page' do 
  scenario 'user signs up with email, password, name, and username' do 
    visit '/users/new' 
    fill_in(:name, with: 'alex')
    fill_in(:username, with: 'alexchen')
    fill_in(:email, with: 'alex@hotmail.com')
    fill_in(:password, with: '12345678')
   
    # save_and_open_page
    click_on('Submit')

    expect(page).to have_content('alex')
    expect(page).to have_content('alexchen')
    expect(page).to have_content('alex@hotmail.com')

  end 
end
