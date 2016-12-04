require 'spec_helper.rb'

feature 'sign up' do
  scenario 'see sign up form' do
    visit('/users/sign-up')
    expect(page).to have_content("sign up")
    find_field('email')
    find_field('password')
    find_button('sign up')
  end

  scenario 'user can sign up for chitter' do
    visit('/users/sign-up')
    fill_in 'email', with: 'hello@example.com'
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'password'
    expect { click_button('sign up').to change(User, :count).by(1) }
    # expect(page).to have_content('welcome hello@example.com')
    #expect(User.first.email).to eq('hello@example.com')
  end

  scenario 'user is unable to sign up without confirming password' do
    visit('/users/sign-up')
    fill_in 'email', with: 'hello@example.com'
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'wrong'
    expect { click_button('sign up') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'password and confirmation do not match'
  end
end
