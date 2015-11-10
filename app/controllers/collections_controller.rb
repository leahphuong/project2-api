class CollectionsController < ApplicationController
  def index
    @collections = Collection.all

    render json: @collections
  end

  def show
    @collection = Collection.find(params[:id])

    render json: @collection

  end

  def create
    @collection = current_user.collections.new(collection_params)
    if @collection.save
      render json: @collection, status: :created,
      location: @collection
    else
      render json: @collection.errors, status: :unprocessable_entity
    end

  end

  def update
    if @collection.update(collection_params)
      head :no_content
    else
      render json: @collection.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @collection.destroy
    head :no_content
  end

  def set_collection
    @collections = current_user.collections.find(params[:id])
  end

  def collection_params
    params.require(:collection).permit(:name, :description)
  end

  private :set_collection, :collection_params
end
