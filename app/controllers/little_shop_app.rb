require_relative "../models/merchant.rb"

class LittleShopApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/' do
    erb :dashboard
  end

  get '/merchants' do
    @merchants = Merchant.all
    erb :"merchants/index"
  end

  get '/merchants/new' do
    erb :"merchants/new"
  end

  get '/merchants/:id' do
    @merchant = Merchant.find_by(id: params[:id])
    erb :"merchants/show"
  end

  post '/merchants' do
    Merchant.create(params[:merchant])
    redirect '/merchants'
  end

end
