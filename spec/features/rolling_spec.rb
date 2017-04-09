feature 'User posts a Roll' do
  before(:each) do
    sign_up
  end

  scenario 'Signed In User fills out roll and posts it' do
    post_roll(message: "Never going to give you up")
    expect(page).to have_content "Never going to give you up"
  end

end
