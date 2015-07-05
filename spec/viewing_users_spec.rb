require 'spec_helper'

feature 'Viewing Users' do 
    scenario 'I can see existing links on the links page' do
    User.create(name: 'Jon', email: 'jon@example.com', password:'oranges')

    visit '/users'

    expect(page.status_code).to eq 200
    expect(page).to have_content 'Jon'
  end
end