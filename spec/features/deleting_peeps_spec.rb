describe "Feature" do

  email = "joemaidman@gmail.com"
  handle = "joe"
  password = "password"
  message = 'Hell there!!'

  before(:each) do
    sign_up(email: email, handle: handle, password: password)
    sign_in(email: email, password: password)
    create_peep(message: message)
  end

  feature 'delete a peep' do
    scenario 'user deletes a link' do
      click_button 'Delete'
      expect(page).not_to have_content("#{message}")
    end
  end

end
