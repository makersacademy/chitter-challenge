describe "Feature" do

  email = "joemaidman@gmail.com"
  handle = "joe"
  password = "password"


  before(:each) do
    sign_up(email: email, handle: handle, password: password)
    sign_in(email: email, password: password)
  end

  feature 'create a new link' do
    message = 'Google'
    scenario 'user creates a new peep' do
      create_peep(message: message)
      expect(page).to have_content("#{message}")
    end
  end

end
