require 'register'

describe Register do
  it 'Has a register class' do
    expect(Register).to respond_to(:new)
  end

  it 'Has a sign_up method' do
    expect(Register).to respond_to(:sign_up)
  end
end
