# frozen_string_literal: true

module Api
  module V1
    class CepsController < ApplicationController
      def index
        cep_value = params[:cep_value]
        data = {}

        data = CepService.new.perform(cep_value) if cep_value.present?

        render json: { data: }, status: :ok
      end
    end
  end
end
