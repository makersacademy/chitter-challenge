feature 'Viewing chitter' do
  scenario 'visiting the index page' do
    visit('/')
    fill_in :first_name, with: 'hafiz'
    fill_in :surname, with: 'alimi'
    fill_in :email, with: 'hafiz@gmail.com'
    fill_in :password, with: '1234567'
    click_button("Sign Up")
    
    expect(page).to have_content("Please fill in this form to create an account.")
    expect(page).to have_field("first_name")
    expect(page).to have_field("surname")
    expect(page).to have_field("email")
    expect(page).to have_field("password")
    expect(page).to have_content("Please fill in this form to create an account.")
  end
  
  scenario 'visiting the index page and canceling' do
    visit('/')
    fill_in :first_name, with: 'sdasd'
    fill_in :surname, with: 'asdas'
    fill_in :email, with: 'asdas'
    fill_in :password, with: 'asdd'
    click_button("Cancel")

    expect(page).to have_content("")
  end

  scenario 'visiting the index page and reading Terms and Privacy' do
    visit('/')
    expect(page).to have_link("Terms & Privacy", :href=>"https://twitter.com/en/tos")
  end
end