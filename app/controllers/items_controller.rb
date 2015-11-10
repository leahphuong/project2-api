class ItemsController < ApplicationController
  #GET /items
  def index
    #show all iems
    @items = Item.all

    render json: @items
  end

  #GET /items/1
  def show
    #show a particular item
    @item = Item.find(params[:id])

    render json: @item
  end

  #POST /items
  def create
    @items = current_user.items.new(item_params)

    if @item.save
      render json: @item, status: :created,
        location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  #PATCH /items/1
  def update
    if @item.update(item_params)
      head :no_content
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end


  #DELETE items/1
  def destroy
    @item.destroy

    head :no_content
  end

  def set_item
    #look up items owned by current user
    @item = current_user.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :photo_url, :description)
  end

  private :set_item, :book_params
end
