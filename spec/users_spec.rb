require 'user'

describe '.create' do
  it 'create new user' do
    connection = PG.connect(dbname: 'makersbnb_test')
    user = User.create(name: 'Hagrid', email: 'hagrid@gmail.com', password: 'hagrid123')
   
    expect(user.name).to eq 'Hagrid'
    expect(user.email).to eq 'hagrid@gmail.com'
    expect(user.password).to eq 'hagrid123'
  end
end
