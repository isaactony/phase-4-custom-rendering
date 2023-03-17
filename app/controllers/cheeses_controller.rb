class CheesesController < ApplicationController
  def summary
    "#{name}: $#{price}"
  end

  # GET /cheeses
  def index
    cheeses = Cheese.all
    if cheeses
      render json: cheeses, except: [:created_at, :updated_at], methods: [:summary]
    else
      render json: { error: 'Cheese not found' }
    end
  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])
    if cheese
      render json: cheese, except: [:created_at, :updated_at], methods: [:summary]
    else
      # status: :not_found will produce a 404 status code
      render json: { error: 'Cheese not found' }, status: :not_found
    end
  end

end
