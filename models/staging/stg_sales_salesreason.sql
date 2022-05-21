with
    source_data as (
        select
            salesreasonid
            , name
            , reasontype
        from {{ source('Adventureworks', 'sales_salesreason') }}
)

select *
from source_data