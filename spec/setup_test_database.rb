require 'pg'

def truncate_table
  DatabaseConnection.query("TRUNCATE TABLE peeps, users")
end

def add_a_user(email)
    click_button 'Sign Up Here!'
    fill_in 'name', with: 'Tony Smith'
    fill_in 'email', with: "#{email}"
    fill_in 'username', with: 'tony_smith'
    fill_in 'password', with: 'password1234'
    click_button 'Submit'
end