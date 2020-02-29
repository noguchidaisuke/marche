require 'rails_helper'

describe 'Restaurants API',type: :request do
    it 'can get connection to Gurunavi API' do
        url = 'https://api.gnavi.co.jp/RestSearchAPI/v3/'
        params = {
            keyid: ENV['GURUNAVI_API_KEY'],
            freeword: "卵と私"
        }
        res=Faraday.get(url,params)
        response_json=JSON.parse(res.body)
        expect(response_json).to include("total_hit_count")
    end
end