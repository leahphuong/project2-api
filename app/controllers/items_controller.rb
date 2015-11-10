class ItemsController < ApplicationController
  #GET /items
  def index
    #show all iems
    @items = Collection.find_by_id(params[:collection_id]).items.all

    render json: @items
  end

  #GET /items/1
  def show
    #show a particular item
    @item = Collection.find_by_id(params[:collection_id]).items.find(params[:id])

    render json: @item
  end

  #POST /items
  def create
    @item = Collection.find_by_id(params[:collection_id]).items.build(item_params)

    if @item.save
      render json: @item, status: :created
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  #PATCH /items/1
  def update
    @item = Collection.find_by_id(params[:collection_id]).items.find(params[:id])
    if @item.update(item_params)
      head :no_content
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end


  #DELETE items/1
  def destroy
    @item = Collection.find_by_id(params[:collection_id]).items.find(params[:id])
    @item.destroy

    head :no_content
  end

  def set_item
    #look up items owned by current user
    # @item = Collection.find_by_id(params[:collection_id]).items.find(params[:id])
    @item = current_user.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :photo_url, :description)
  end

  private :set_item, :item_params
end
