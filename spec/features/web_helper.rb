def sign_up_and_post
  visit  ('/signup')
  fill_in :username, with:("Goku")
  fill_in :peep, with:("I am the strongest saiyan")
  click_button("Submit")
end
