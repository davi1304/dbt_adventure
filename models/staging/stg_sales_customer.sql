with
    source_data as (
        select
            customerid
            , personid
        from {{ source('Adventureworks', 'sales_customer') }}
)

select *
from source_data