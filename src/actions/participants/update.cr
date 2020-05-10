class Participants::Update < BrowserAction
  route do
    participant = ParticipantQuery.find(participant_id)
    SaveParticipant.update(participant, params) do |operation, participant|
      if operation.saved?
        flash.success = "The record has been updated"
        redirect Sessions::Show.with(participant.session_id)
      else
        flash.failure = "It looks like the form is not valid"
        html EditPage, operation: operation, participant: participant
      end
    end
  end
end
