require 'spec_helper'


feature "writing a cheep" do

  let!(:user) do
    User.create(email: 'database_guru@gmail.com',
                name: 'Lord Vader',
                user_name: 'darth',
                password: 'awesome123',
                password_confirmation: 'awesome123')
  end

  scenario 'a logged in user can write a cheep' do
    sign_in
    visit '/cheeps/new'
    fill_in :body, with: "The force is strong"
    click_button 'cheep'
    expect(page).to have_content "The force is strong"
  end

  scenario 'a logged in user cannot submit an empty cheep' do
    sign_in
    visit '/cheeps/new'
    fill_in :body, with: nil
    click_button 'cheep'
    expect(page).to have_content "Where's your cheep?"
  end

  scenario 'a non logged in user cannot cheap' do
    visit '/cheeps/new'
    fill_in :body, with: "The force is strong"
    click_button 'cheep'
    expect(page).to have_content "Please sign in or create an account"
    expect(current_path).to eq '/cheeps'
  end
end
