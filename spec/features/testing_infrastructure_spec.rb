# frozen_string_literal: true

feature 'Visiting Homepage:' do
  scenario 'Welcomes the User' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter!'
    expect(page.status_code).to eq(200)
  end
end
