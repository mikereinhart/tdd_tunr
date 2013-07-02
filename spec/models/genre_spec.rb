require 'spec_helper'

describe Genre do

  subject(:genre) { create :genre }

  describe 'associations' do
    it 'has songs' do
      expect(subject).to respond_to :song
    end
  end
end
