feature 'User sign up' do

  let(:user) { user = build(:user) }

  scenario 'new user sign up' do
    expect { sign_up_as(user) }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome #{user.name}")
    expect(User.first.email).to eq('humptydumpty@wall.com')
  end
end
