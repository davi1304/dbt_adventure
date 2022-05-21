with
    source_data as (
        select
            addressid
            , city
            , stateprovinceid
        from {{ source('Adventureworks', 'person_address') }}
)

select *
from source_data