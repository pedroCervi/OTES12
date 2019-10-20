require 'rails_helper'

RSpec.describe Components::PersonComponent do
  describe '.valid?' do
    it 'raises NotImplementedError' do
      expect { described_class.new.valid? }.to raise_error(NotImplementedError)
    end
  end

  describe '.type' do
    it 'raises NotImplementedError' do
      expect { described_class.new.type }.to raise_error(NotImplementedError)
    end
  end
end
