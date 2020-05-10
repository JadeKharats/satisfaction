class Participants::Edit < BrowserAction
  route do
    participant = ParticipantQuery.find(participant_id)
    html EditPage,
      operation: SaveParticipant.new(participant),
      participant: participant
  end
end
