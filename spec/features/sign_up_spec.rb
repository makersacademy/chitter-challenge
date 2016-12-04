require 'spec_helper.rb'

feature 'sign up' do
  scenario 'see sign up form' do
    visit('/')
    expect(page).to have_content("sign up")
    find_field('email')
    find_field('password')
    find_button('sign up')
  end

  scenario 'user can sign up for chitter' do
    visit('/')
    fill_in 'email', with: 'hello@example.com'
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'password'
    expect { click_button('sign up').to change(User, :count).by(1) }
    # expect(page).to have_content('welcome hello@example.com')
    #expect(User.first.email).to eq('hello@example.com')
  end

  scenario 'user is unable to sign up without confirming password' do
    visit('/')
    fill_in 'email', with: 'hello@example.com'
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'wrong'
    expect { click_button('sign up') }.not_to change(User, :count)
  end
end
