class FloorsController < ApplicationController
  def new
  end

  def create
    begin
      store = Store.find(params[:store_id])
      floor = store.floors.create({nick: params[:nick]})
        if floor.save
          render json: floor
        else
          render json: floor.errors, status: 400
        end
    rescue
      render text: "No store found with store_id: #{params[:store_id]}", status: 400
    end
  end

  def edit
  end

  def show
    puts params
    begin
      store = Store.find(params[:store_id])
      begin
        floor = store.floors.find(params[:id])
        render json: floor.to_json(root: true, :include => [:sections])
      rescue
        render text: "No floor found with: #{params[:id]} for store #{params[:store_id]}", status: 400
      end
    rescue
      render text: "No store found with store_id: #{params[:store_id]}", status: 400
    end
  end

  def index
    begin
      store = Store.find(params[:store_id])
      render json: store.floors.to_json(root: true)
    rescue
      render text: "No store found with store_id: #{params[:store_id]}", status: 400
    end
  end
end