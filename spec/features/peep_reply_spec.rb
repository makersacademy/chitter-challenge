RSpec.feature "Reply to peep" do

  let!(:user){ User.create(email: "test@test.com", username: "test_user",
                name: "Testy Man", password: "passw0rd")}

  before(:each){
    sign_up #as realDjango
    make_peep "Lorem Ipsum dolor sit amit cur"
    sign_out
    sign_in
  }

  scenario "create a reply" do
    visit '/peeps'
    click_button 'reply'
    field = find_field("content")
    expect(field.value).to eq "@realDjango"
  end

end
