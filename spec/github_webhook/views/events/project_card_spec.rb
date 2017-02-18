require 'spec_helper'
require_relative '../../../../apps/github_webhook/views/events/project_card'

describe GithubWebhook::Views::Events::ProjectCard do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/webhook/templates/events/project_card.html.erb') }
  let(:view)      { GithubWebhook::Views::Events::ProjectCard.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    skip 'This is an auto-generated test. Edit it and add your own tests.'

    # Example
    view.foo.must_equal exposures.fetch(:foo)
  end
end
