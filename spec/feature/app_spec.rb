# frozen_string_literal: true

feature 'Account page' do
  scenario 'visiting the account page' do
    visit('/')
    expect(page).to have_content "Welcome."
  end
end
