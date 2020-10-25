require 'rails_helper'

RSpec.describe 'Status Request', type: :request do
  context 'without error' do
    it 'returns a successful response' do
      get '/status'

      expect(response.body).to be_empty
      expect(response).to have_http_status(ActiveStatus.configuration.success)
    end
  end

  context 'with errors' do
    before do
      ActiveStatus.configuration.check :failing_check do
        raise StandardError
      end
    end

    it 'returns an error response' do
      get '/status'

      expect(response.body).to include('failing_check')
      expect(response).to have_http_status(ActiveStatus.configuration.error)
    end
  end
end
