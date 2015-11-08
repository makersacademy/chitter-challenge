feature "Users can sign up for Chitter" do

  scenario "When registering my details" do
    sign_up
    expect(page).to have_content 'Welcome Alaan!'
    expect{sign_up}.to change(Maker, :count).by(1)
  end

  scenario "I cannot sign up without filling in all details" do
    visit('/sign_up')
    expect{partial_sign_up}.not_to change(Maker, :count)
  end
 end
