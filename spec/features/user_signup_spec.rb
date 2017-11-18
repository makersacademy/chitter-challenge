feature 'user can sign up' do
  scenario 'user can enter their details and create an account' do
    expect { create_account }.to change { User.all.length }.by(1)
  end

  scenario 'user can see a welcome message after sign up' do
    create_account
    expect(page).to have_content('Welcome tmerrr!')
  end
end
