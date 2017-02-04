require 'spec_helper'




feature 'User posts a peep' do

  let!(:user) do
    User.create(email: 'test@test.com',
                name: 'Testy McTest',
                user_name: 'Test1',
                password: '123456',
                password_confirmation: '123456')
  end

  scenario "authenticated user can post a chitter message" do
        sign_in
        visit '/peep'
        fill_in :peep, with: "Test!"
        puts :peep
        click_button "Submit peep"
        expect(page).to have_content  "Test!"
        expect(page).to have_content "Test1"
  end

end
