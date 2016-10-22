feature 'User Sign Up' do

  scenario 'A new user can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Hola, Tony')
    expect(User.first.first_name).to eq('Tony')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end
end
