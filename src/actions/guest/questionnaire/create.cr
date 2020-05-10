class Guest::Questionnaire::Create < BrowserAction
  include Auth::AllowGuests
  route do
    SaveQuestionnaire.create(params) do |operation, questionnaire|
      if questionnaire
        flash.success = "The record has been saved"
        redirect Show.with(questionnaire.id)
      else
        flash.failure = "It looks like the form is not valid"
        html Guest::Participant::IndexPage, operation: operation, participant_id: operation.participant_id.value.not_nil!
      end
    end
  end
end
