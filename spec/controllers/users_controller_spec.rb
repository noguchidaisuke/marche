require 'rails_helper'

RSpec.describe Public::SessionsController, type: :controller do
    let!(:user) {create(:user)}
    describe do
        it 'login 'do
            session[:id] = user.id
            expect(current_user).to eq(user)
        end
    end
end