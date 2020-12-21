class ManagementsController < ApplicationController

  def index
    @managements = Management.all
  end


  def update
    @management.update(management_params)
  end

  private

  def management_params
    params.require(:management).permit(:age, :gender, :unit_price).merge(user_id: current_user.id, record_id: params[:record_id], )
  end

end
