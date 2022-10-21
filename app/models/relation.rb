class Relation < ActiveRecord::Base
    self.table_name = :planet_osm_rels

    scope :interstate, -> { where("tags @> ?", "{US:I}") }

    def self.[](id)
        find_by_id(id)
    end

    def parts
        super.map { |x| Node[x] || Way[x] || Relation[x] }
    end

    def relations
        Relation.where("parts @> ?", "{#{id}}")
    end
end