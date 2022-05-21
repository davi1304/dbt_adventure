with
    source_data as (
        select
            salesorderid
            , orderqty
            , productid
            , specialofferid
            , unitprice
        from {{ source('Adventureworks', 'sales_salesorderdetail') }}
)

select *
from source_data