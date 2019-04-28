feature 'sign up ' do
  scenario 'sign_up' do
    signup_simon
    expect(current_path).to eq "/"
  end

end
