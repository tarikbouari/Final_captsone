class Api::V1::CarsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :destroy]
    before_action :set_car, only: [:destroy, :show]

    def index
        @cars = Car.all
        render json: {car: @cars}, status: :ok
    end

    def show
        render json: {car: @car}, status: :ok
    end
    
    def create 
        car = Car.new(car_params)
        if car.save!
            render json: {
              status: 201,
              message: 'Car has been successfully created',
            }, status: :created
          else
            render json: { error: 'ERROR: Unable to create the car' }, status: :unprocessable_entity
          end
    end
end
