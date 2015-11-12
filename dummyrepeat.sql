
-------------------------------

Create table dummy_train_format_1 as
select
    user_id as user_id,
	merchant_id as merchant_id,
	max(`a1`) as No_Repetido,
	max(`a2`) as Repetido,
	max(`a3`) as Tipo_desconocido
from
(select 
    user_id,
 	merchant_id,
 	case label when 0 then 1 else 0 end as a1,
  	case label when 1 then 1 else 0 end as a2,
  	case label when null then 1 else 0 end as a3
from train_format_1) t group by user_id, merchant_id;

---------------------------------

Create table dummy_user_log_format_1 as
select
  user_id,
	item_id,
	cat_id,
	merchant_id,
	brand_id,
	time_stamp,
	max(`a1`) as Click,
	max(`a2`) as Carro,
	max(`a3`) as Comprar,
	max(`a4`) as Favorito,
	max(`a5`) as Accion_desconocida
from
(select 
  user_id,
 	item_id,
 	cat_id,
 	merchant_id,
 	brand_id,
 	time_stamp,
 	case action_type when 0 then 1 else 0 end as a1,
  	case action_type when 1 then 1 else 0 end as a2,
  	case action_type when 2 then 1 else 0 end as a3,
  	case action_type when 3 then 1 else 0 end as a4,
  	case action_type when null then 1 else 0 end as a5
from user_log_format_1) t group by user_id, item_id, cat_id, merchant_id, brand_id, time_stamp, a1, a2, a3, a4, a5;

---------------------------------

Create table dummy_user_info_format_1 as
select
    user_id,
	max(`a1`) as menor18,
	max(`a2`) as entre18y24,
	max(`a3`) as entre25y29,
	max(`a4`) as entre30y34,
	max(`a5`) as entre35y39,
	max(`a6`) as entre40y49,
	max(`a7`) as mayor50,
	max(`a8`) as Edad_Desconocida,
    max(`g1`) as Femenino, 
    max(`g2`) as Masculino, 
    max(`g3`) as Genero_Desconocido 
from
(select 
    user_id,
 	case age_range when 1 then 1 else 0 end as a1,
  	case age_range when 2 then 1 else 0 end as a2,
  	case age_range when 3 then 1 else 0 end as a3,
  	case age_range when 4 then 1 else 0 end as a4,
  	case age_range when 5 then 1 else 0 end as a5,
  	case age_range when 6 then 1 else 0 end as a6,
  	case when age_range = 7 or age_range = 8 then 1 else 0 end as a7,
	case when age_range = 0 or age_range = null then 1 else 0 end as a8,
    case gender when 0 then 1 else 0 end as g1,
    case gender when 1 then 1 else 0 end as g2,
    case when gender = 2 or gender = null then 1 else 0 end as g3
from user_info_format_1) t group by user_id;

-------------------------------------
--JOIN

Create table dummy_join_table as
select
c.user_id as user_id,
b.menor18 as menor18,
b.entre18y24 as entre18y24,
b.entre25y29 as entre25y29,
b.entre30y34 as entre30y34,
b.entre35y39 as entre35y39,
b.entre40y49 as entre40y49,
b.mayor50 as mayor50,
b.edad_desconocida as edad_desconocida,
b.femenino as femenino,
b.masculino as masculino,
b.genero_desconocido as genero_desconocido,
c.item_id as item_id,
c.cat_id as cat_id,
c.merchant_id as merchant_id,
c.brand_id as brand_id,
c.time_stamp as time_stamp,
c.click as click,
c.carro as carro,
c.comprar as comprar,
c.favorito as favorito,
c.accion_desconocida as accion_desconocida,
a.no_repetido as no_repetido,
a.repetido as repetido,
a.tipo_desconocido as tipo_desconocido
from dummy_user_log_format_1 c
left outer join 
dummy_user_info_format_1 b on c.user_id = b.user_id
left outer join 
dummy_train_format_1 a on (c.user_id = a.user_id and c.merchant_id = a.merchant_id)
;
