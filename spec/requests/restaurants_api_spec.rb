require 'rails_helper'

describe 'Restaurants API',type: :request do
    it 'loads restaurants' do
        url = 'https://api.gnavi.co.jp/RestSearchAPI/v3/'
        @freeword = '卵'
        params = {
            keyid: ENV['GURUNAVI_API_KEY'],
            freeword: @freeword
        }
        Faraday.get(url,params)
        response_json = JSON.parse(response.body)
    end
end