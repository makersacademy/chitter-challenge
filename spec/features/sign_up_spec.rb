feature 'Sign up' do

  scenario 'New Users can sign up' do
    Peep.create(text: 'I am feeling good')
    visit '/'
    sign_up
    expect(page).to have_content('I am feeling good')
  end

  scenario "New user forget to fill_in the username's field" do
    visit '/'
    fill_in :new_email,         with: 'myemail@email.com'
    fill_in :new_name,          with: 'myname'
    fill_in :new_password,      with: 'mypassword'
    click_button "Sign up"
    expect(page).to have_content("All fields need to be filled in")
  end
end
