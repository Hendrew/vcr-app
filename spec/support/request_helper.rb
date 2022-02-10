# frozen_string_literal: true

module RequestHelper
  def json
    @json ||= JSON.parse(response.body, symbolize_names: true)
  end

  def auth_headers(resource)
    @auth ||= resource.create_new_auth_token
    @auth.merge({ 'Content-Type' => 'application/json', 'Accept' => 'application/json' })
  end
end
