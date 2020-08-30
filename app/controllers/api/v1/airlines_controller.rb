module Api
  module V1
    
    class AirlinesController < ApplicationController
      def index
        @airline = Airline.all
        render json: @airline
      end

      def show
        @airline = find_airline
        if @airline
          render json: @airline
        end
      end

      def create
        @airline = Airline.create(airline_params)
        if @airline.save
          render json: @airline
        else
          render json: { error: 'Cannot create new airline' }, status: :unprocessable_entity
        end
      end

      def update
        @airline = find_airline
        if @airline
          @airline.update(airline_params)
          render json: { message: 'Airline successfully updated' }, status: :ok
        else
          render json: { error: 'Cannot update airline' }
        end
      end

      def destroy
        @airline = find_airline
        if @airline
          @airline.destroy
          render json: { message: 'Airline successfully deleted' }, status: :ok
        else
          render json: { error: 'Cannot delete airline' }, status: :no_content
        end
      end

      private

      def airline_params
        params.require(:airline).permit(:name, :image_url)
      end

      def find_airline
        Airline.find_by(slug: params[:slug])
      end
    end

  end
end