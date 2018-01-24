require_relative "../models/merchant.rb"

class LittleShopApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/' do
    erb :dashboard
  end

end
