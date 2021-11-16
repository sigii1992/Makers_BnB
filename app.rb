

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

  run! if app_file == $PROGRAM_NAME
end

