require './lib/user'
require 'sinatra/base'
require 'sinatra/reloader'
require './lib/property'

class MakersBnB < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/properties' do
    @properties = Property.all
    @current_user = session[:name]
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
    User.create(name: params[:name], email: params[:email], password: params[:password])
    redirect '/users/thankyou'
  end

  get '/users/thankyou' do
    erb :'users/thankyou'
  end

  get '/users/login' do
    erb :'users/login'
  end

  # post '/users/login' do
  #   p session[:name] = User.log_in(email: params[:email], password: params[:password])
  #    p @current_user = session[:name]
  #   redirect '/properties'
  # end

  post '/users/login' do
    @user = User.log_in(email: params[:email], password: params[:password])
      session[:name] = @user.name
      session[:email] = @user.email
      session[:id] = User.find_id(email: @user.email)
      redirect '/properties'
  end



  run! if app_file == $PROGRAM_NAME
end

