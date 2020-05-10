class Participants::Delete < BrowserAction
  route do
    participant = ParticipantQuery.find(participant_id)
    session_id = participant.session_id
    participant.delete
    flash.success = "Deleted the record"
    redirect Sessions::Show.with(session_id)
  end
end
