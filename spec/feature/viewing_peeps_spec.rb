# frozen_string_literal: true

feature 'Viewing peeps' do
  scenario 'allows viewing of all peeps' do
    visit('/')
    expect(page).to have_content "Peeps"
  end
end
