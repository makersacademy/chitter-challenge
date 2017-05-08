require 'web_helper.rb'
feature 'Can sign up' do
  scenario 'the user can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome! Exampleton')
    expect(User.first.email).to eq('example@gmail.com')
  end
end
