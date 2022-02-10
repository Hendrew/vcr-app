# frozen_string_literal: true

class CepService < ApplicationService
  def initialize(cep_value)
    @cep_value = cep_value
  end

  def perform
    response = Faraday.get("https://viacep.com.br/ws/#{@cep_value}/json/")

    return {} unless response.status == 200

    json = JSON.parse(response.body, symbolize_names: true)
  end
end
