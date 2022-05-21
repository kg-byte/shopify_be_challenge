class ItemsController < ApplicationController

  def index
    @items = Item.all 
  end
  
  def new
  end 

  def create 
    new_item = Item.create(item_params)
    if new_item.save
      redirect_to '/items'
    else
      redirect_to '/items/new'
      flash[:alert] = "#{new_item.errors.full_messages.to_sentence}"
    end
  end 


private 
  def item_params
    params.permit(:name, :description, :quantity, :status)
  end
end