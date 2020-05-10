class Participants::Create < BrowserAction
  route do
    SaveParticipant.create(params, code: Random.new.hex(3)) do |operation, participant|
      if participant
        flash.success = "The record has been saved"
        redirect Sessions::Show.with(participant.session_id)

      else
        flash.failure = "It looks like the form is not valid"
        html NewPage, operation: operation
      end
    end
  end
end
