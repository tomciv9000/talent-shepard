module ActorsHelper

    def union_status(actor)
        if actor.sag_aftra == true && actor.aea == true
            "AEA and SAG-AFTRA"
        elsif actor.sag_aftra == true
            "SAG-AFTRA"
        elsif actor.aea == true
            "AEA"
        else
            "Non-Union"
        end
    end

    def birthdate(actor)
        actor.dob.strftime("Birthday: %B %e, %Y")
    end

end
