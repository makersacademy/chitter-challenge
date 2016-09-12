require 'spec_helper'

feature "Viewing cheeps" do

  let!(:user) do
    User.create(email: 'database_guru@gmail.com',
                name: 'Lord Vader',
                user_name: 'darth',
                password: 'awesome123',
                password_confirmation: 'awesome123')
  end

  scenario "can view links on a page" do
    user.cheeps.create(body: "I am your father",
                                created_at: Time.now,
                                posted_by: user.name,
                                handle: user.user_name)
    visit '/cheeps'
    expect(page.status_code).to eq 200

    within 'ul#cheeps' do
      expect(page).to have_content('I am your father')
    end
  end

end
