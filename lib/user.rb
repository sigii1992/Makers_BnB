require 'pg'
require 'bcrypt'


class User
attr_reader :id, :name, :email, :password

  def initialize(id:, name:, email:, password:)
    @id = id
    @name = name
    @email = email
    @password = password
  end

  def self.create(name:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
  
    result = connection.exec_params("INSERT INTO users (name, email, password) VALUES($1, $2, $3) RETURNING id, name, email, password;", [name, email, encrypted_password])
    User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'], password: result[0]['password'])
  end


  def self.find_id(email:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec_params("SELECT * FROM users WHERE email = $1", [email])
    result[0]['id']
    
  end


  def self.log_in(email:, password:)
    if ENV['ENVIRONMENT'] == "test"
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("SELECT * FROM users WHERE email = $1", [email])
    User.new(email: result[0]['email'], name: result[0]['name'], id: result[0]['id'], password: result[0]['password'])
  end
end
