

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/property'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello from the MakersBnB app!'
  end

  run! if app_file == $PROGRAM_NAME
end
