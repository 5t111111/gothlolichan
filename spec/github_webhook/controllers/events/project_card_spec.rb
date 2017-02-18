require 'spec_helper'
require_relative '../../../../apps/github_webhook/controllers/events/project_card'

describe GithubWebhook::Controllers::Events::ProjectCard do
  let(:action) { GithubWebhook::Controllers::Events::ProjectCard.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
