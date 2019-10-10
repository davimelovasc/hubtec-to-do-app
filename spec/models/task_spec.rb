require 'rails_helper'

RSpec.describe Task, type: :model do
    let!(:task) { FactoryBot.build(:task, :with_user) }

    describe "Associations" do
        it 'should belogns to a user' do
          expect(task).to belong_to :user
      end #{ should belong_to :user}
    end

    describe 'Validations' do
        
        describe 'is title present' do
            it "should have a title" do 
              expect(task).to validate_presence_of(:title)
            end
        end

        describe 'is deadline present' do
            it  "should have a deadline" do
              puts task.deadline
              expect(task.deadline).not_to be_nil
            end
        end

        it 'if status nil, must set status' do
            task.status = nil
            task.save
            expect(task).to be_valid
        end

        context 'associated models' do
            it 'is valid with associated model' do
              expect(task).to be_valid
            end
        end


    end

    context 'deadline' do
        it 'must not be in the past on creation' do
          task = Task.new(deadline: 1.day.ago, title: "teste")
          task.save
          expect(task).to_not be_valid
        end
  
        it 'must be today or in the future' do
          task.deadline = Date.today
          task.save
          expect(task).to be_valid
        end
      end

    


    ## describe 'Self Methods'

end