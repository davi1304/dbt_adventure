with
    source_data as (
        select
            productid
            , name
        from {{ source('Adventureworks', 'production_product') }}
)

select *
from source_data