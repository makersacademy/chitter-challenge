# frozen_string_literal: true

feature 'Index' do
  scenario 'user can load' do
    visit '/'
    expect(page).to have_content 'Chitter'
  end
end
