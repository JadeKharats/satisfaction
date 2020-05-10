class Participants::Show < BrowserAction
  route do
    html ShowPage, participant: ParticipantQuery.find(participant_id)
  end
end
