require 'spec_helper'
require_relative '../../../../apps/webhook/controllers/github/project_card'

describe Webhook::Controllers::Github::ProjectCard do
  let(:action) { Webhook::Controllers::Github::ProjectCard.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
