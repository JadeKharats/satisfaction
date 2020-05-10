class Guest::Participant::Index < BrowserAction
  include Auth::AllowGuests
  param participant_code : String?
  route do
    participant = ParticipantQuery.new.code(participant_code.not_nil!).first?
    if participant
      html IndexPage, participant_id: participant.id
    else
      redirect to: Home::Index
    end
  end
end
