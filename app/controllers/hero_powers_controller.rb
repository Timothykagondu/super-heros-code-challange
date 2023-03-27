class HeroPowersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    skip_before_action :verify_authenticity_token
    
def create
    hero =Hero.find(params[:hero_id])
    hero_power = HeroPower.create!(hero_power_params) 
    render json: hero, serializer:
    SingleheroSerializer

end

private

def hero_power_params
    params.permit(:strength, :hero_id, :power_id) 
  end

  def render_not_found_response
    render json: { error: "Validation errors" }, status: :not_found
 end

end
