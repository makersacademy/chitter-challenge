require 'web_helpers'

feature 'sign up' do
  scenario 'can sign up, and is recorded in database' do
    expect { sign_up }.to change{ User.count }.by(1)
    expect(page).to have_content('Welcome mmm')
  end
end
