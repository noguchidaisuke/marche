require 'rails_helper'
require 'faraday'

RSpec.describe RestaurantsController, type: :controller do
    describe 'APItest' do
        let(:url){'https://api.gnavi.co.jp/RestSearchAPI/v3/'}
        let(:params){{keyid: ENV['GURUNAVI_API_KEY'],freeword: '肉'}}
        it do
            Faraday.get(url,params)
            expect(response.status).to eq 200
        end
    end
end