class Home::IndexPage < AuthLayout
  def content
    tag("section", class: "hero is-success is-fullheight") do
      div class: "hero-body" do
        div class: "container has-text-centered" do
          h1 class: "title" do
            text "Satisfaction"
          end
          h2 class: "subtitle" do
            text "Le questionnaire de fin de formation"
          end
          render_form_session_number
        end
      end
    end
  end

  private def render_form_session_number
    form_for(Guest::Session::Index, method: "get") do
      div class: "field" do
        div class: "control" do
          input(class: "input", name: "session_code")
        end
      end
      div class: "field" do
        button("Vérifier le code", role: "submit", class: "button is-info is-fullwidth")
      end
    end
  end
end
