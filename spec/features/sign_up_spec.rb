require './web_helper'

feature 'User registration' do
  scenario 'User signs-up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, BartJudge@gmail.com')
    expect(User.first.email).to eq('BartJudge@gmail.com')
  end
  scenario  'password confirmation' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  scenario 'when password and password_confirmation do not match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Please make sure Password and Confirmation Password match'
  end
  scenario "registration will not complete without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end
  scenario "registration will not complete without a valid formatted email address" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
  end
end
