
PEEPS = [
  "Some text practice peep",
   "Some more text, for variety practice peep",
   "A longer practice peep, perhaps slightly humourous, maybe it's a political comment, or just what I had for dinner"
 ]
def bunch_of_peeps
  10.times do
    Peep.create(
    text: PEEPS.sample,
    date_time: DateTime.now,
    user_id: rand(1..2)
    )
  end
end

def sign_up_2_users
  User.create("Name", "email", "password")
  User.create("Other Name", "other email", "password")
end

def sign_in
  visit '/'
  click_link 'sign in'
  fill_in 'email', with: 'email'
  fill_in 'password', with: 'password'
  click_button 'submit'
end
