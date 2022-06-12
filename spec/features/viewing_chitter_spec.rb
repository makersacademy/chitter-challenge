feature 'Viewing chitter' do
  scenario 'visiting the index page' do
    visit('/')
    fill_in :first_name, with: 'hafiz'
    fill_in :email, with: 'hafiz@gmail.com'
    fill_in :username_id, with: 'hafiz1234'
    fill_in :password_id, with: '1234567'
    click_button("Sign Up")
    
    expect(page).to have_content("Please fill in this form to create an account.")
    expect(page).to have_field("first_name")
    expect(page).to have_field("email")
    expect(page).to have_field("username_id")
    expect(page).to have_field("password_id")
    expect(page).to have_content("Please fill in this form to create an account.")
  end
  
  scenario 'visiting the index page and canceling' do
    visit('/')
    fill_in :first_name, with: 'sdasd'
    fill_in :email, with: 'asdas'
    fill_in :username_id, with: 'asdas'
    fill_in :password_id, with: 'asdd'
    click_button("Cancel")

    expect(page).to have_content("")
  end

  scenario 'visiting the index page and reading Terms and Privacy' do
    visit('/')
    expect(page).to have_link("Terms & Privacy", :href=>"https://twitter.com/en/tos")
  end
end