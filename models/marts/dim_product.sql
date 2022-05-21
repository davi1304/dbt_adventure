with
    product as (
        select
            row_number() over (order by productid) as product_sk
            , productid
            , name
        from {{ ref('stg_production_product')}} as product
    )

select * from product