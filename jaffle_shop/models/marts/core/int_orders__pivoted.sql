{%- set payements_method = ["bank_transfer", "credit_card", "coupon", "gift_card"] -%}

with payement as (
    select * from {{ ref("stg_stripe_payments") }}
),

final as (
    select order_id,
    {%- for payement in payements_method -%}
    sum(case when payment_method = '{{payement}}' then amount else 0 end ) as {{payement}}_amount
    {%- if not loop.last -%} , {%- endif -%}

    {% endfor %}
    from payement
    group by 1

)

select * from final 

