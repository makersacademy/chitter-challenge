require './app/app.rb'


feature 'Signing up to Chitter' do

  scenario 'User goes to the signup screen and adds a name, email and password' do

    visit '/signup'
    expect(page.status_code).to eq 200
    fill_in 'First name', with: 'Simon'
    fill_in 'Last name', with: 'Conway'
    fill_in 'Email', with: 'simon.conway@condaal.com'
    fill_in 'password', with: 'Password'
    click_button('Sign up')
    expect{ sign_up }.to change(User :count).by(1)
    expect(Page).to have_content("Hello Simon")
    expect(User.first.email).to eq("simon.conway@condaal.com")

  end
end
