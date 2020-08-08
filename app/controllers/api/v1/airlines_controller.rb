module Api 
  module V1
    
    class AirlinesController < ApplicationController
      def index
        airline = Airline.all
        render json: airline
      end

      def show
        airline = Airline.find_by(slug: params[:slug])
        if airline
          render json: airline
        end
      end

      private

      def airline_params
        params.require(:airline).permit(:name, :image_url)
      end
    end
  end
end
