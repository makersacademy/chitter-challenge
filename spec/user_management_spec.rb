feature 'User sign up' do

  scenario 'with a password that does not match' do
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email, with: 'bryony@bryony.com'
    fill_in :password, with: 'lemons'
    fill_in :name, with: 'bryony'
    fill_in :username, with: 'bryorama'
    fill_in :password_confirmation, with: 'strawberry'
    click_button 'Sign up'
    expect(current_path).to eq('/users') # current_path is a helper provided by Capybara
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, bryony@bryony.com')
    expect(User.first.email).to eq('bryony@bryony.com')
  end

  scenario "I can't sign up with an invalid email address" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
  end


    scenario 'I cannot sign up with an invalid email address' do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end


end
