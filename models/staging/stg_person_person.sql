with
    source_data as (
        select
            businessentityid
            , firstname
            , middlename
            , lastname
        from {{ source('Adventureworks', 'person_person') }}
)

select *
from source_data