require 'rails_helper'
require 'webmock/rspec'
describe 'Restaurants API',type: :request do
    it 'loads restaurants' do
        url = 'https://api.gnavi.co.jp/RestSearchAPI/v3/'
        @freeword = '卵'
        params = {
            keyid: ENV['GURUNAVI_API_KEY'],
            freeword: @freeword
        }
        res=Faraday.get(url,params)
        expect(JSON.parse(res.body).length).to eq(5)
    end
end