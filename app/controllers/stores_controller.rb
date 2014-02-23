class StoresController < ApplicationController
  def new
  end

  def create
    store = Store.create({longitude: params[:longitude],
                          latitude: params[:latitude],
                          name: params[:name]})
    if store.save
      render json: store
    else
      render json: store.errors, status: 400
    end
  end

  def edit
  end

  def show
    begin
      store = Store.find(params[:id])
      render json: store.to_json(root: true, :include => [:floors])
    rescue
      render text: "No store found with id: #{params[:id]}", status: 400
    end
  end

  def index
    stores = Store.all
    render json: stores.to_json(root: true)
  end
end