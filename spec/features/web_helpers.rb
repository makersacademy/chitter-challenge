
def login
  visit '/'
  click_button 'sign up'
  fill_in :first_name, with: "Eddie"
  fill_in :last_name, with: "Arnold"
  fill_in :email, with: "123@me.com"
  fill_in :user_password, with: "12345"
  click_button "get chitting"
  visit '/peeps/new'
  fill_in :peep, with: 'First peep'
  click_button "submit"
end