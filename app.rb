

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/property'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/properties' do
    @properties = Property.all
   erb :'properties/view'
  end

  get '/properties/new' do
    erb :'properties/new'
  end

  post '/properties/new' do
    Property.create(name: params[:name], description: params[:description], price_per_night: params[:price_per_night])
    redirect '/properties'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    # Users.create(name: params[:name], email: params[:email], password: params[:password])
    # users=[params[:name], params[:email], params[:password]]
    users={name: 'Hagrid', email: 'hagrid@gmail.com', password: 'hagrid123' }
    redirect '/users/thankyou'
  end

  get '/users/thankyou' do
    erb :'users/thankyou'
  end



  run! if app_file == $PROGRAM_NAME
end

