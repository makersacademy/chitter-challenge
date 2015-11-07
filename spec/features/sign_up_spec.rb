feature "Users can sign up for Chitter" do

  scenario "When registering my details" do
    sign_up
    expect(page).to have_content 'Welcome Alaan!'
    expect{sign_up}.to change(Maker, :count).by(1)
  end
 end
