with
    source_data as (
        select
            specialofferid
            , productid
        from {{ source('Adventureworks', 'sales_specialofferproduct') }}
)

select *
from source_data