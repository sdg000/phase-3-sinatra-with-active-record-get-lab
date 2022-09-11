class ApplicationController < Sinatra::Base

  #setting content header type:
  set :default_content_type, 'application/json'

  # add routes

  get "/bakeries" do 
    Bakery.all.to_json
  end

  get "/bakeries/:id" do 
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get "/baked_goods/by_price" do 
    baked_goods = BakedGood.all
    baked_goods.order(price: :desc).to_json
  end

  get "/baked_goods/most_expensive" do 
    most_expensive = BakedGood.all.order(price: :desc).first 
    most_expensive.to_json
  end
end
