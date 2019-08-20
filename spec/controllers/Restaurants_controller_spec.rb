require 'rails_helper'

RSpec.describe RestaurantsController, type: :controller do
    describe 'APItest' do
        let(:freeword){'肉'}
        let(:url){'https://api.gnavi.co.jp/RestSearchAPI/v3/'}
        let(:keyid){ENV['GURUNAVI_API_KEY']}
        it do
            expect(freeword).to eq('肉')
        end
    end
end
