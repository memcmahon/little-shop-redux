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

  get '/categories-dashboard' do
    @categories = Category.all
    @includes_most_expensive_item = Category.includes_most_expensive_item
    @includes_least_expensive_item = Category.includes_least_expensive_item
    erb :"categories/dashboard"
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

  get '/items' do
    @items = Item.all
    erb :"items/index"
  end

  get '/items/new' do
    @merchants  = Merchant.all
    @categories = Category.all
    erb :"items/new"
  end

  get '/items/:id' do
    @item = Item.find(params[:id])
    erb :"items/show"
  end

  get '/items/:id/edit' do
    @item       = Item.find(params[:id])
    @merchants  = Merchant.all
    @categories = Category.all
    erb :"items/edit"
  end

  get '/items-dashboard' do
    @total_count    = Item.count
    @average_price  = Item.average_price
    @oldest         = Item.oldest.title
    @most_recent    = Item.most_recent.title
    erb :"items/dashboard"
  end

  post '/items' do
    Item.create(params[:item])
    redirect '/items'
  end

  put '/items/:id' do
    item = Item.find(params[:id])
    item.update(params[:item])
    redirect "/items/#{item.id}"
  end

  delete '/items/:id' do
    item = Item.find(params[:id])
    item.destroy
    redirect '/items'
  end
end
