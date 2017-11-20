# rubocop:disable all
feature 'When visiting the signup page' do
  scenario 'I can enter email and password and submit the form' do
    # As a Maker
    # So that I can post messages on Chitter as me
    # I want to sign up for Chitter
    real_name = 'Harry Blackstone Copperfield Dresden'
    sign_in_greeting = "Welcome to the peepline, Harry Blackstone Copperfield Dresden. Let's Peep together!"

    sign_up
    expect(User.first.email_address).to eq('HarryBCDresden@aol.com')
    expect(User.first.real_name).to include(real_name)
    expect(User.first.username).to include 'Hoss'
    expect(page).to have_content(sign_in_greeting)
  end

  scenario "I can't sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario "I can't sign up with an invalid email address" do
    expect { sign_up(email: 'baaaad@blob') }.not_to change(User, :count)
  end
end
