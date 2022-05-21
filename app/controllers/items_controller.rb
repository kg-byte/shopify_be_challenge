class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update]
  def index
    @items = Item.all 
  end
  
  def new
  end 

  def create 
    new_item = Item.create(item_params)
    if new_item.save
      redirect_to items_path
    else
      redirect_to new_item_path
      flash[:alert] = "#{new_item.errors.full_messages.to_sentence}"
    end
  end 

  def edit
  end

  def update
    item_update = @item.update(item_params)
    if item_update
      redirect_to items_path
    else
      redirect_to edit_item_path(@item)
      flash[:alert] = "#{@item.errors.full_messages.to_sentence}"
    end

  end

private 
  def item_params
    params.permit(:name, :description, :quantity, :status)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end