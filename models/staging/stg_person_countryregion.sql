with
    source_data as (
        select
            countryregioncode
            , name
        from {{ source('Adventureworks', 'person_countryregion') }}
)

select *
from source_data