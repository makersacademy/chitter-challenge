require 'spec_helper'

  feature 'post peep' do

    let!(:user) do
      User.create(name: 'suse',
                  email: 'suse@gmail.com',
                  password: 'piano',
                  password_confirmation: 'piano')
    end

    scenario 'user can post new peep' do
      sign_in
      click_button "Post-a-peep"
      fill_in "peep", :with => "I ate pizza for tea"
      click_button "Post-a-peep"
      expect(page).to have_content "I ate pizza for tea"
    end
end
