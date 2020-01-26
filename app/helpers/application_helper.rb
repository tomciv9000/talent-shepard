module ApplicationHelper
    
    def full_name(person)
        person.first_name.capitalize + " " + person.last_name.capitalize
    end



    def description_row(label, content)
        description_label(label) + description_content(content)
    end

    def small_text(content)
        content_tag(:small, content, class: ["form-text", "text-muted"])
    end

  


    private
    
    def description_label(label)
        content_tag(:dt, label, class: "col-sm-3") 
    end

    def description_content(content)
        content_tag(:dd, content, class: "col-sm-9")
    end

end
