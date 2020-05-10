class Guest::Session::IndexPage < AuthLayout
  needs name : String
  def content
    tag("section", class: "hero is-success is-fullheight") do
      div class: "hero-body" do
        div class: "container has-text-centered" do
          h1 class: "title" do
            text name
          end
          h2 class: "subtitle" do
            text "Entrez votre code individuel"
          end
          render_form_participant_number
        end
      end
    end
  end

  private def render_form_participant_number
    form_for(Guest::Participant::Index, method: "get") do
      div class: "field" do
        div class: "control" do
          input(class: "input", name: "participant_code")
        end
      end
      div class: "field" do
        button("Vérifier le code participant", role: "submit", class: "button is-info is-fullwidth")
      end
    end
  end
end
