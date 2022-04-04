class SpicesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    
    def index
        render json: Spice.all
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        spice = find_spice
        spice.update(spice_params)
        render json: spice, status: :accepted
    end

    def destroy
        spice = find_spice
        spice.destroy
        head :no_content
    end

    private
    
    def find_spice
        Spice.find(params[:id])
    end

    def render_not_found_response
        render json: { error: "Spice not found" }
    end

    def spice_params
        params.permit(:rating, :id, :title, :image, :notes, :description)
    end
end
