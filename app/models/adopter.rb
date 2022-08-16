class Adopter < ActiveRecord::Base
    has_many :pets
    has_many :shelters, through: :pets

    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    def adopt pet
        if pet.adopted? == false
            pet.update(adopted?:true, adopter_id:self.id)
        else
            "#{pet.name} has already been adopted"
        end
    end

    def fav_pet
        pets = self.pets.group(:species).count
        if pets == {}
            return nil
        else
            pets.first[0]
        end
    end
end
