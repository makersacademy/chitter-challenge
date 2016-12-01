feature 'Signing up' do

  scenario 'I can sign up as a new user' do
    sign_up
    expect{sign_up}.to change(User, :count).by(1)
    expect(User.first.name).to eq('John Smith')
    expect(User.first.email).to eq('jsmith@gmail.com')
    expect(User.first.username).to eq('jsmith2016')
  end


end
