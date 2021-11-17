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

describe '.find' do
  it 'finds a user by email' do
    connection = PG.connect(dbname: 'makersbnb_test')
    user = User.create(name: 'Hagrid', email: 'hagrid@gmail.com', password: 'hagrid123')
    result = User.find(email: user.email)

    expect(result).to eq user.id
    # expect(result.name).to eq user.name
    # expect(result.email).to eq user.email
    # expect(result.password).to eq user.password
  end
end