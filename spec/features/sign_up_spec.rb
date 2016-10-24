feature 'User Sign Up' do

  scenario 'a new user can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Hola, Tony')
    expect(User.first.first_name).to eq('Tony')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario "can't sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario "can't sign up with an invalid email address" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario "can't sign up with an existing email" do
    sign_up
    expect { sign_up(first_name: 'Captain',
                    last_name: 'America',
                    email: 'tony.stark@starkindustries.com',
                    password: 'shield',
                    password_confirmation: 'sheild',
                    user_name: 'Cap') }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

  scenario "can't sign up with an existing username" do
    sign_up
    expect { sign_up(first_name: 'Captain',
                    last_name: 'America',
                    email: 'captain.america@shield.org',
                    password: 'shield',
                    password_confirmation: 'shield',
                    user_name: 'TDawg') }.to_not change(User, :count)
    expect(page).to have_content('User name is already taken')
  end
end
