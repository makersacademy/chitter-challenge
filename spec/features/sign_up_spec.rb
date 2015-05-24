require_relative 'helpers/session'
include SessionHelpers

feature 'user signs up' do
  scenario 'I want to sign up when visiting the page' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, test@test.com')
    expect(User.first.email).to eq('test@test.com')
  end
  scenario 'user signs up with non matching passwords' do
  expect { sign_up('t@t.com', 'right', 'wrong') }.to change(User, :count).by(0)
   expect(current_path).to eq('/users')
    expect(page).to have_content('Sorry, your passwords do not match')
  end

  scenario 'user signs up with existing email' do
    expect { sign_up }.to change(User, :count).by(1)
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content('This email is already taken')
  end


end

