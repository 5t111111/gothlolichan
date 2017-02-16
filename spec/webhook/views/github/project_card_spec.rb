require 'spec_helper'
require_relative '../../../../apps/webhook/views/github/project_card'

describe Webhook::Views::Github::ProjectCard do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/webhook/templates/github/project_card.html.erb') }
  let(:view)      { Webhook::Views::Github::ProjectCard.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    skip 'This is an auto-generated test. Edit it and add your own tests.'

    # Example
    view.foo.must_equal exposures.fetch(:foo)
  end
end
