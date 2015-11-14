describe 'Categories Requests', type: :request do
  context 'when authorized' do
    #before(:each) { login_as_admin } -> TODO VS when auth system will be configured
    context 'and no Categories' do
      it 'index is successful' do
        get admin_categories_path
        expect(response).to be_successful
      end

      it 'new is successful' do
        get new_admin_category_path
        expect(response).to be_successful
      end

      it 'create is successful' do
        post admin_categories_path, category: attributes_for(:category)
        follow_redirect!
        expect(response).to be_successful
      end
    end

    context 'and exists category' do
      before(:each) { create(:category) }
      let(:first_category) { Category.first }

      it 'edit is successful' do
        get edit_admin_category_path(first_category)
        expect(response).to be_successful
      end

      it 'update is successful' do
        put admin_category_path(first_category), category: attributes_for(:category, :other)
        follow_redirect!
        expect(response).to be_successful
      end

      it 'destroy is successful' do
        delete admin_category_path(first_category)
        follow_redirect!
        expect(response).to be_successful
      end
    end
  end

  context 'when not authorized' do
    it 'redirect to home page' do
      get admin_categories_path
      #follow_redirect! -> TODO VS when auth system will be configured
      expect(response).to be_successful
    end
  end
end
