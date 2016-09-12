require 'spec_helper'

  feature 'post peep' do

    let!(:user) do
      User.create(name: 'Erce Kal',
                  username: 'erce',
                  email: 'erce@erce.com',
                  password: '123456',
                  password_confirmation: '123456')
    end

    scenario 'user can post new peep' do
      sign_in
      click_button "Post peep"
      fill_in "peep", :with => "I slept very late!"
      click_button "Post peep"
      expect(page).to have_content "I slept very late!"
    end
end
