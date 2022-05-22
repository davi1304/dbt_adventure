 with 
    customers as (
        select 
        customer_sk
        , customerid
        from {{ref('dim_customer')}}
    ),

    address as (
        select 
        address_sk
        , addressid
        from {{ref('dim_address')}}
    ),

    product as (
        select 
        product_sk
        , productid
        from {{ref('dim_product')}}
    ),

    salesreason as (
        select 
        salesreason_sk
        , salesreasonid
        from {{ref('dim_reason')}}
    ),

    salesorderdatail as (
        select *
        from {{ref('stg_sales_salesorderdetail')}}
    ),

    creditcard as (
        select 
        creditcard_sk
        , creditcardid
        from {{ref('dim_creditcard')}}
    ),

    salesreasonheader as (
        select *
        from {{ref('stg_sales_salesorderheadersalesreason')}}
    ),



    orders_with_sk as (
        select
          row_number() over (order by orders.salesorderid) as sales_sk
        , orders.salesorderid as order_id
        , orders.orderdate as order_date
        , orders.status as status
        , salesorderdatail.orderqty as order_qty
        , salesorderdatail.unitprice as unit_price
        , salesreasonheader.salesreasonid as sales_reason_id
        , customers.customer_sk as customer_fk
        , address.address_sk as address_fk
        , product.product_sk as product_fk
        , salesreason.salesreason_sk as salesreason_fk
        , creditcard.creditcard_sk as creditcard_fk
        from {{ref('stg_sales_salesorderheader')}} as orders
        left join salesorderdatail on orders.salesorderid = salesorderdatail.salesorderid
        left join customers on orders.customerid = customers.customerid
        left join address on orders.shiptoaddressid = address.addressid
        left join product on salesorderdatail.productid = product.productid
        left join salesreasonheader on orders.salesorderid = salesreasonheader.salesorderid
        left join salesreason on salesreasonheader.salesreasonid = salesreason.salesreasonid
        left join creditcard on orders.creditcardid = creditcard.creditcardid
        

    ),

    final as (
        select
        sales_sk
        , order_id
        , order_date
        , status
        , order_qty
        , unit_price
        , sales_reason_id
        , customer_fk 
        , address_fk
        , product_fk
        , salesreason_fk
        , creditcard_fk
        from orders_with_sk
    )

    select * from final
