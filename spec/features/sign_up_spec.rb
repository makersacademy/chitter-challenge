# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
feature 'user sign up' do
  scenario 'a user may sign up to Chitter' do
    expect{ sign_up }.to change(User, :count).by (1)
    expect(page).to have_content "Edward's Chitter!"
    expect(User.first.email).to eq ('edwardkerry@gmail.com')
  end

  scenario 'an email is required' do
    expect{ sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario 'email must be correct format' do
    expect { sign_up(email: 'edwardkerry.gmail') }.not_to change(User, :count)
  end
end
