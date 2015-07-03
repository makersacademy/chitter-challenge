

feature 'User can sign up' do

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    visit '/'
    expect(page).to have_content('Welcome, Elin Ng')
    expect(User.name).to eq('Elin Ng')
  end
  
end