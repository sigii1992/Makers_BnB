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

# describe '.get_id' do
#   it 'returns the id of the logged-in user' do
#     user = Account.create(name: "Bigmoneybob", email: "Bigmoneybob@hotmail.com", password: "test")
#     user_id = Account.get_id(email: user.email)
#     expect(user_id).to be_a(String)
#   end
# end
# end

describe '.log_in' do 
  it 'logs in a user' do
    User.create(name: 'Hagrid', email: 'hagrid@gmail.com', password: 'hagrid123')
    user = User.log_in(email: 'hagrid@gmail.com', password: 'hagrid123')
    expect(user.name).to eq 'Hagrid'
  end
end




# describe '.find' do
#   it 'finds a user by ID' do
#     user = User.create(email: 'test@example.com', password: 'password123')
#     result = User.find(id: user)

#     expect(result.id).to eq user.id
#     expect(result.email).to eq user.email
#   end

