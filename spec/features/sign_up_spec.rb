feature 'sign up' do
  scenario 'user successfully registers' do
    expect { sign_up }.to change { User.count }.by 1
    expect(current_path).to eq '/peeps'
  end
end
