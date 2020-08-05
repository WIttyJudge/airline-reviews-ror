module Api 
  module V1
    
    class AirlinesController < ApplicationController
      def index
        airline = Airline.all
        render json: airline
      end

      private 
      
      def airlines_params
        param.require(:airline).permit(:name, :image_url)
      end

    end
  end
end
