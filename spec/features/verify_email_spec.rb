feature 'email verification' do
  scenario 'empty email entered' do
    expect { sign_up(email: '') }.to change(User, :count).by(0)
  end
  let(:wrong_format_1) { 'dave' }
  let(:wrong_format_2) { 'dave.com' }
  scenario 'incorrect format used' do
    expect { sign_up(email: wrong_format_1) }.to change(User, :count).by(0)
    expect { sign_up(email: wrong_format_2) }.to change(User, :count).by(0)
  end
  scenario 'existing email used' do
    expect { 2.times { sign_up } }.to change(User, :count).by(1)
  end
end
