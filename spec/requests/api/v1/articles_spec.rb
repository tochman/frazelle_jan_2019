require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :request do
	describe 'GET /api/v1/articles' do
		before do
			category = create(:category)
			5.times { create( :article, category: category ) }
		end
		it 'returns a collection of articles' do
			get '/api/v1/articles'
			expect(JSON.parse(response.body)['articles'].count).to eq 5
		end
	end
end