feature 'Signing up' do
  scenario 'I can sign up to chitter' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome Chris')
  end
end
