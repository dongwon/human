describe 'Constraining order' do
  it 'passes when the messages are received in declared order' do
    collaborator_1 = double("Collaborator 1")
    collaborator_2 = double("Collaborator 2")

    expect(collaborator_1).to receive(:step_1).ordered
    expect(collaborator_2).to receive(:step_2).ordered
    expect(collaborator_1).to receive(:step_3).ordered

    collaborator_1.step_1
    collaborator_2.step_2
    collaborator_1.step_3
  end
end
