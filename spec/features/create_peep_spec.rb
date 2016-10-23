require_relative 'web_helpers'

feature 'create a peep' do
  let!(:user) do
    User.create(first_name: "Alan",
                last_name: "Shearer",
                username: "alan123",
                email: "alan@nufc.com",
                password: "password123",
                password_confirmation: "password123")
  end
  it 'creates a peep object and stores it to the database' do
    visit '/sessions/sign_in'
    fill_in "email", with: "alan@nufc.com"
    fill_in "password", with: "password123"
    click_button "Sign in"
    fill_in "peep", with: "My first peep"
    expect{ click_button "PEEP" }.to change{ Peep.all.count }.by(1)
  end

  it 'displays all peeps in the database' do
    register
    sign_in
    create_peep("I am bored")
    expect(current_path).to eq "/peeps/peepdeck"
    expect(page).to have_content "I am bored"
  end

end
