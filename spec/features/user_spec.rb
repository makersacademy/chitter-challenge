require 'user'
 describe User do
  it "returns user's name" do
    user = User.new('Muge', 'muge.hasilci@hotmail.com', 'artemis', 'kizkulesi')
    expect(user.name).to eq 'Muge'
  end

   it "returns user's  email" do
     user = User.new('Muge', 'muge.hasilci@hotmail.com', 'artemis', 'kizkulesi')
    expect(user.email).to eq 'muge.hasilci@hotmail.com'
  end

  it "returns user's  username" do
    user = User.new('Muge', 'muge.hasilci@hotmail.com', 'artemis', 'kizkulesi')
   expect(user.username).to eq 'artemis'
  end
   it "gives user a password" do
     user = User.new('Muge', 'muge.hasilci@hotmail.com', 'artemis', 'kizkulesi')
    expect(user.password).to eq 'kizkulesi'
  end
 end
