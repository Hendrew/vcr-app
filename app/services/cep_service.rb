# frozen_string_literal: true

class CepService
  def perform(cep_value)
    response = Faraday.get("https://viacep.com.br/ws/#{cep_value}/json/")

    return {} unless response.status == 200

    JSON.parse(response.body, symbolize_names: true)
  end
end
