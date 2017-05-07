feature 'User can sign up for Chitter' do

  scenario 'Ana creates an account on Chitter with good password confirmation' do
    create_account(name: 'Ana Maria Suciu',
                   username: 'ana',
                   email: 'ana@great.com',
                   password: 'apples')
    expect { create_account }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome to Chitter, ana@great.com')
    expect(User.first.email).to eq('ana@great.com')
  end

end
