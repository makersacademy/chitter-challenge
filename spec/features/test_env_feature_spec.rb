# frozen_string_literal: true

feature 'Feature Test Environment Feature' do
  scenario 'Developer wants to confirm feature test environment is correctly configured' do
    visit '/feature_test_env'
    expect(page).to have_content 'FEATURE TEST ENV WORKING'
  end
end
