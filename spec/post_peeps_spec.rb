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

  scenario 'Allow user to see Enter Peep form' do
    click_button('Post Peep')
    expect(current_path).to eq('/peeps/new')
    expect(page).to have_content('Gimme your Peep')
  end

  scenario 'Peep is created' do
    Peep.create(peep: "Test peep")
    expect { post_peep }.to change(Peep, :count).by(1)
  end

  scenario 'Allow user to see Peep at /home' do
    post_peep
    expect(current_path).to eq '/home'
    expect(page).to have_content("Test peep")
  end

  scenario 'Allow user to see Peep author' do
    post_peep
    expect(page).to have_content("By: tansaku")
  end
end
