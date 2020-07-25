require 'sinatra'
require "sinatra/namespace"
require './services/propublica_service'
require './serializers/representative_serializer'
require './serializers/senator_serializer'
require 'pry'

namespace '/api/v1' do

  before do
    content_type 'application/json'
  end

  get '/representatives' do
    service = get_propublica
    json = service.house_members
    RepresentativeSerializer.new(json).json_api
  end

  get '/senators' do
    service = get_propublica
    service.senators
    binding.pry
    SenatorSerializer.new(json)
  end
end

private

def get_propublica
  PropublicaService.new
end
