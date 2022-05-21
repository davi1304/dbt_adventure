with
    source_data as (
        select
            salesreasonid
            , salesorderid
        from {{ source('Adventureworks', 'sales_salesorderheadersalesreason') }}
)

select *
from source_data