feature 'sign_in' do

  before(:each) do
    sign_up
  end

  scenario 'it successfully signs in a user' do
    sign_in
    expect(page).to have_content 'Welcome, Tobes'
  end
end
