with
    source_data as (
        select
            stateprovinceid
            , countryregioncode
            , name
        from {{ source('Adventureworks', 'person_stateprovince') }}
)

select *
from source_data