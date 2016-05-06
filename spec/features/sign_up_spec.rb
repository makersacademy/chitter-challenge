feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up(SessionHelpers::PARAMS_CORRECT) }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, pepe@gmail.com')
    expect(User.first.email).to eq('pepe@gmail.com')
    #expect(User.first.name).to eq("Pepe Domingo Castaño")
  end

  scenario 'Requires a matching confirmation password' do
    params = set_params({password_confirmation: "321"})
    expect { sign_up(params) }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario 'Requires a non-empty email address' do
    params = set_params({email: ""})
    expect { sign_up(params) }.not_to change(User, :count)
  end

  scenario "user can't sign up with invalid format email" do
    params = set_params({email: "pep@gma"})
    expect { sign_up(params) }.not_to change(User, :count)
  end

  scenario "user can't sign up if email already registered" do
    sign_up(SessionHelpers::PARAMS_CORRECT)
    expect { sign_up(SessionHelpers::PARAMS_CORRECT) }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content "Email is already taken"
  end
end