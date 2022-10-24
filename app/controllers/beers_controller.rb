class BeersController < ApplicationController
  def index
    @beers = PunkApi::Client.new.beers(beer_name: params[:query], per_page: 10)
  end
end
