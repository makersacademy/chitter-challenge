require 'spec_helper'

feature 'Making peeps' do
  let!(:user) do
    User.create(email: 'dave@example.com',
                name: 'dave',
                user_name: 'B1GDAVE',
                password: '123',
                password_confirmation: '123')
  end
  scenario 'user can add peep' do
    sign_in(email: user.email, password: user.password)
    visit '/peeps/new'
    expect(page.status_code).to eq(200)
    fill_in :peep_text, with: "This is my first peep"
    click_button 'Send Peep'
    expect(Peep.count).to eq(1)
    expect(page).to have_content('This is my first peep')
  end
end
