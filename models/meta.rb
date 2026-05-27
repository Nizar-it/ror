class Meta < ApplicationRecord

    self.table_name = "metas"
    belongs_to :mettaable, polymorphic: true

end