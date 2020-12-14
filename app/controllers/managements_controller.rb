class ManagementsController < ApplicationController

  def index
    query = "SELECT * FROM managements"
    @managements = Management.find_by_sql(query)
  end

  def update
    @management.update(management_params)
  end

  private

  def management_params
    params.require(:management).permit(:age, :gender, :unit_price).merge(user_id: current_user.id, record_id: params[:record_id], )
  end

end
