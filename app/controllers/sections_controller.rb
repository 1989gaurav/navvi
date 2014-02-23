class SectionsController < ApplicationController
  def new
  end

  def create
    puts params
    begin
      store = Store.find(params[:store_id])
      begin
        floor = store.floors.find(params[:floor_id])
        section = floor.sections.create({longitude: params[:longitude],
                                         latitude: params[:latitude],
                                         nick: params[:nick],
                                         image: params[:image]})
        if section.save
          render json: section.to_json(root: true, only: [:id, :latitude, :longitude, :nick, :image_file_name], methods: :image_url)
        else
          render json: section.errors, status: 400
        end
      rescue => e
        puts e.message
        puts e.backtrace
        render text: "No floor found with floor_id: #{params[:floor_id]} for store: #{params[:store_id]}", status: 400
      end
    rescue
      render text: "No store found with store_id: #{params[:store_id]}", status: 400
    end
  end

  def edit
  end

  def show
    begin
      store = Store.find(params[:store_id])
      begin
        floor = store.floors.find(params[:floor_id])
        begin
          section = floor.sections.find(params[:id])
          render json: section.to_json(root: true, only: [:id, :latitude, :longitude, :nick, :image_file_name], methods: :image_url)
        rescue
          render text: "No section found with id: #{params[:id]} for floor_id: #{params[:floor_id]} and store: #{params[:store_id]}", status: 400
        end
      rescue
        render text: "No floor found with floor_id: #{params[:floor_id]} for store: #{params[:store_id]}", status: 400
      end
    rescue
      render text: "No store found with store_id: #{params[:store_id]}", status: 400
    end
  end

  def index
    begin
      store = Store.find(params[:store_id])
      begin
        floor = store.floors.find(params[:floor_id])
        render json: floor.sections.to_json(root: true, only: [:id, :latitude, :longitude, :nick, :image_file_name], methods: :image_url)
      rescue
        render text: "No floor found with floor_id: #{params[:floor_id]} for store: #{params[:store_id]}", status: 400
      end
    rescue
      render text: "No store found with store_id: #{params[:store_id]}", status: 400
    end
  end
end