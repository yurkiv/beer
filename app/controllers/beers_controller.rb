class BeersController < ApplicationController
  def index
    @beers = PunkApi::Client.new.beers(request_params)

    respond_to do |format|
      format.html { }
      format.turbo_stream { }
    end
  end

  private

  def request_params
    request_params = { per_page: 10 }
    request_params[:beer_name] = params[:query] if params[:query].present?
    request_params
  end
end
