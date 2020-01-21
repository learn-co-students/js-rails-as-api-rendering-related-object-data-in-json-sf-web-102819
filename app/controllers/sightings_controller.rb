class SightingsController < ApplicationController

  def index
    sightings = Sighting.all
    # render json: sightings

    # Same as 2) in show()
    render json: sightings.to_json(include: [:bird, :location])

  end
  
  def show
    sighting = Sighting.find_by(id: params[:id])
    # 1) render json: sighting

    # 2) render json: { id: sighting.id, bird: sighting.bird, location: sighting.location }

    # 3) An alternative to above is to use the include option to indicate what models you want to nest and lists all attributes
    # render json: sighting, include: [:bird, :location]

    if sighting
      render json: sighting.to_json(include: [:bird, :location])
    else
      render json: { message: 'No sighting found with that id' }
    end

  end
end
