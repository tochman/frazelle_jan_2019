RSpec.describe Api::V1::ArticlesController, type: :request do
	let(:headers) { { HTTP_ACCEPT: 'application/json' } }
	let(:article) { FactoryBot.create(:article)}

	describe 'GET /api/v1/articles' do
		before do
			5.times { Article.create({ title: 'some title', content: 'some random content' }) }
		end
		it 'returns a collection of articles' do
			get '/api/v1/articles', headers: headers
			expect(response_json['articles'].count).to eq 5
		end
	end
end