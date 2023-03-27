class PowersController < ApplicationController
    
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    skip_before_action :verify_authenticity_token
    
    def index
        powers = Power.all
        render json: powers
    end

    def show
        power = find_power_id
        render json: power
    end

    def update
        power = find_power_id
        power.update!(power_params) 
        render json: power
    rescue ActiveRecord::RecordInvalid => e
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end




    private


    def power_params
        params.permit(:name, :description)
    end

    def find_power_id
        Power.find(params[:id])
    end

    def render_not_found_response
        render json: { error: "Power not found" }, status: :not_found
     end


end
