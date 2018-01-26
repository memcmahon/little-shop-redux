require 'pry'

class LittleShopApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

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

  get '/merchants/:id/edit' do
    @merchant = Merchant.find_by(id: params[:id])
    erb :"merchants/edit"
  end

  post '/merchants' do
    Merchant.create(params[:merchant])
    redirect '/merchants'
  end

  put '/merchants/:id' do
    merchant = Merchant.find_by(id: params[:id])
    merchant.update(name: params[:merchant][:name])
    redirect "/merchants/#{merchant.id}"
  end

  delete '/merchants/:id' do
    merchant = Merchant.find_by(id: params[:id])
    merchant.destroy
    redirect '/merchants'
  end

  get '/categories' do
    @categories = Category.all
    erb :"categories/index"
  end

  get '/categories/new' do
    erb :"categories/new"
  end

  get '/categories/:id' do
    @category = Category.find_by(id: params[:id])
    erb :"categories/show"
  end

  get '/categories/:id/edit' do
    @category = Category.find_by(id: params[:id])
    erb :"categories/edit"
  end

  post '/categories' do
    Category.create(params[:category])
    redirect '/categories'
  end

  put '/categories/:id' do
    category = Category.find_by(id: params[:id])
    category.update(name: params[:category].values.first)
    redirect "/categories/#{category.id}"
  end

  delete '/categories/:id' do
    category = Category.find_by(id: params[:id])
    category.destroy
    redirect '/categories'
  end
end
