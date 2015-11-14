class CardStepsController < ApplicationController
  include Wicked::Wizard
  steps :upload, :crop,  :age

  def show
    @card = Card.find(params[:card_id])
    render_wizard
  end
  def update
    @card = Card.find(params[:card_id])
    @card.attributes = card_steps_params
    render_wizard @card
  end

  private  
    def card_steps_params
      params.require(:card).permit(:name, :age, :avatar, :avatar_original_w, :avatar_original_h, :avatar_box_w, :avatar_aspect, :avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h)
    end

end
