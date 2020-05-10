class Sessions::Create < BrowserAction
  route do
    SaveSession.create(params, uid: Random.new.hex(3)) do |operation, session|
      if session
        flash.success = "The record has been saved"
        redirect Show.with(session.id)
      else
        flash.failure = "It looks like the form is not valid"
        html NewPage, operation: operation
      end
    end
  end
end
