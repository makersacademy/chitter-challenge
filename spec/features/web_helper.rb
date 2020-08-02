def logintopage
  visit '/'
    fill_in'Email', with: "test@test.com"
    fill_in'Password', with: "test123"
    click_button("Log in")
end

def addpeep
  click_button('Add Peep')
  fill_in'peep_text', with: "This is a first Peep"
  click_button('Add Peep')
end