feature 'sign up' do

  scenario 'user signs up succesfully' do
    visit '/users/new'
    fill_in(:name, with: 'Trisha')
    fill_in(:email, with: 'Trisha@person.com')
    fill_in(:username, with: 'Wizard_Trish')
    fill_in(:password, with: 'password')
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Wizard_Trish')
    expect(User.first.email).to eq 'Trisha@person.com'
  end

  def sign_up
    visit '/users/new'
    fill_in(:name, with: 'Trisha')
    fill_in(:email, with: 'Trisha@person.com')
    fill_in(:username, with: 'Wizard_Trish')
    fill_in(:password, with: 'password')
    click_button('Sign up')
  end

end
