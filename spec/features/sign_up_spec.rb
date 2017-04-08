feature 'sign up' do
  scenario 'user successfully registers' do
    expect { sign_up }.to change { User.count }.by 1
    expect(current_path).to eq '/peeps'
  end

  scenario 'user does not enter first name' do
    expect { sign_up(first_name: "") }.not_to change { User.count }
  end

  scenario 'user does not enter last name' do
    expect { sign_up(last_name: "") }.not_to change { User.count }
  end
end
