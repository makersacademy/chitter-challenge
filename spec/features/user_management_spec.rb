feature 'user sign up' do
  scenario 'i can sign up as new user' do
    expect {sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Toby Muir-Little')
    expect(User.first.email).to eq ('toby@fish.com')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  scenario 'with a password that does not match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users') # current_path is a helper provided by Capybara
    expect(page).to have_content 'Password and confirmation password do not match'
  end


end
