require 'spec_helper'

feature 'I want to post a peep' do

  let!(:user) do
    User.create(username: "tansaku",
              name: "Samuel Russell Hampden Joseph",
              email: "sam@makersacademy.com",
              password: "s3cr3t",
              password_confirmation: "s3cr3t")
  end

  before(:each) do
    sign_in(username: user.username, password: user.password)
  end

  scenario 'Allow user to post a peep that can be seen on home screen' do
    click_button('Post Peep')
    expect(current_path).to eq '/peeps/new'
    expect(page).to have_content('Gimme your Peep')
  end
end
