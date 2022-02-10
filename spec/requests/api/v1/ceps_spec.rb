# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Ceps', type: :request do
  describe 'GET /api/v1/ceps' do
    context 'when cep_value is null' do
      before do
        get '/api/v1/ceps', params: {}
      end

      it 'returns status code :ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns null' do
        expect(json[:data]).to eq({})
      end
    end

    context 'when cep_value is not null' do
      before do
        VCR.use_cassette('cep') do
          get '/api/v1/ceps?cep_value=66610170', params: {}
        end
      end

      it 'returns status code :ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns correct info' do
        expect(json[:data][:cep]).to eq('66610-170')
        expect(json[:data][:logradouro]).to eq('Passagem Rosa')
        expect(json[:data][:complemento]).to eq('')
        expect(json[:data][:bairro]).to eq('Curió-Utinga')
        expect(json[:data][:localidade]).to eq('Belém')
        expect(json[:data][:uf]).to eq('PA')
        expect(json[:data][:ibge]).to eq('1501402')
        expect(json[:data][:gia]).to eq('')
        expect(json[:data][:ddd]).to eq('91')
        expect(json[:data][:siafi]).to eq('0427')
      end
    end
  end
end
