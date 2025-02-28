class BggController < ApplicationController
  before_action :authenticate_user!
  def fetch_data
    if current_user.bgg_username.present?
      FetchBggDataJob.perform_later(current_user.bgg_username)
      render json: {message: "Fetching data for #{current_user.bgg_username}"}
    else
      render json: {error: "No BGG username linked to your account"}, status: :unprocessable_entity   
    end
  end
end
