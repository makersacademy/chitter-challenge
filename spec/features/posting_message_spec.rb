# frozen_string_literal: true

feature 'posting a message' do
  scenario 'loading main page' do
    visit('/chitter')

    expect(page.status_code).to eq 200
  end
  scenario 'creating a message to chitter' do
    visit('/chitter')
    fill_in('peep', with: 'This is a peep')
    click_button('submit')

    expect(page.status_code).to eq 200
    expect(page).to have_content 'This is a peep'
  end
end
