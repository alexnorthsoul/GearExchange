describe Category, type: :model do

  let(:some_category) { build(:category) }

  context 'CRUD' do
    it 'new' do
      expect(some_category).to be_new_record
    end

    it 'save & create' do
      expect{some_category.save}.to change{Category.count}.by 1
    end

    it 'create with parent_id' do
      some_category.save
      new_category = Category.new(name: 'Category with parent', parent_id: some_category.id)
      expect{new_category.save}.to change{Category.count}.by 1
      expect(new_category).to have_attributes parent_id: some_category.id
    end

    it 'read' do
      expect(some_category).to have_attributes name: 'First category', parent_id: nil,description: 'Lorem...'
    end

    it 'update' do
      some_category.update_attributes(attributes_for(:category, :other))
      expect(some_category).to have_attributes name: 'Second category', parent_id: nil,description: 'Ipsum...'
    end

    it 'destroy' do
      some_category.save
      expect{some_category.destroy}.to change{Category.count}.by -1
    end
  end

  context 'validations' do
    context 'presence' do
      it 'new category be valid' do
        expect(some_category).to be_valid
      end

      it 'name be invalid' do
        some_category.name = ''
        expect(some_category).not_to be_valid
      end
    end
  end
end
