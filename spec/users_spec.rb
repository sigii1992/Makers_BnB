require 'user'

describe '.create' do
  it 'create new user' do
    user = User.create(name: 'Hagrid', email: 'hagrid@gmail.com', password: 'hagrid123')
   
    expect(user.name).to eq 'Hagrid'
    expect(user.email).to eq 'hagrid@gmail.com'
    # expect(user.password).to exist?!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  end

  it 'hashes the password using BCrypt' do
    expect(BCrypt::Password).to receive(:create).with('hagrid123')
    User.create(name: 'Hagrid', email: 'hagrid@gmail.com', password: 'hagrid123')
  end
end

describe '.find_id' do
  it 'finds a user by id' do
    user = User.create(name: 'Hagrid', email: 'hagrid@gmail.com', password: 'hagrid123')
    result = User.find_id(email: user.email)
    expect(result).to eq user.id
  end
end

describe '.log_in' do 
  it 'logs in a user' do
    user = User.create(name: 'Hagrid', email: 'hagrid@gmail.com', password: 'hagrid123')
    authenticated_user = User.log_in('hagrid@gmail.com','hagrid123')
    # took colon
    expect(authenticated_user.id).to eq user.id
  end
end