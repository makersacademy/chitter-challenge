feature 'user signup' do

  scenario 'a new user can sign up' do
    visit '/signup'
    fill_in('email', with: 'a@b.com')
    fill_in('name', with: 'Michael Bluth')
    fill_in('username', with: 'hermano')
    expect { click_button('Sign Up') }.to change { User.count }.by(1)
    expect(User.first.email).to eq('a@b.com')
  end
end
