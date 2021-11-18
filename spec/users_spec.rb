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

describe '.find_id' do
  it 'finds a user by id' do
    user = User.create(name: 'Hagrid', email: 'hagrid@gmail.com', password: 'hagrid123')
    result = User.find_id(email: user.email)
    expect(result).to eq user.id
  end
end

describe '.log_in' do 
  it 'logs in a user' do
    User.create(name: 'Hagrid', email: 'hagrid@gmail.com', password: 'hagrid123')
    user = User.log_in(email: 'hagrid@gmail.com', password: 'hagrid123')
    expect(user.name).to eq 'Hagrid'
  end
end

# describe '.logout' do
#   it 'logs a user out' do
#     User.create(name: 'Hagrid', email: 'hagrid@gmail.com', password: 'hagrid123')
#     user = User.log_in(email: 'hagrid@gmail.com', password: 'hagrid123')
#     # user.log_out
#     expect(user.name).to eq nil
#   end
# end