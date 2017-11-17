feature 'Feature: signing up' do
  let(:fields) { [:name, :password, :handle, :email, :confirmation] }

  scenario 'user does not complete form before submitting' do
    fields.each do |sym|
      expect { sign_up(sym => '') }.to_not change { User.count }
    end
  end

  scenario 'user enters mismatching passwords' do
    expect { sign_up(confirmation: 'mismatch') }.to_not change { User.count }
  end

  scenario 'user enters valid details' do
    expect { sign_up }.to change { User.count }.by(1)
    expect(page).to have_content 'Welcome, person'
  end
end
