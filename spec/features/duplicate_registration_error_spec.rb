require 'helpers'

feature 'Duplicate registration error --' do
  include Helpers

  scenario 'User unabe to register with existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end
