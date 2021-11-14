# frozen_string_literal: true

RSpec.describe CukewrapperData do
  it 'has a version number' do
    expect(CukewrapperData::VERSION).not_to be nil
  end
end
