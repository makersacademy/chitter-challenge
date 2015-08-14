feature 'Viewing peeps' do
  scenario 'I can see all the peeps' do 

    user = User.create(name: "name", user_name: "user_name", email: "email",
      password: "password", password_confirmation: "password")
    Peep.create(text: "This is the first peep", creation_time: Time.new, user_id: user.id)
    visit '/'
    expect(page.status_code).to eq 200
    expect(page).to have_content("This is the first peep")
  end
end