# frozen_string_literal: true

VCR.configure do |c|
  c.cassette_library_dir = Rails.root.join('spec/vcr')
  c.hook_into :faraday
end
